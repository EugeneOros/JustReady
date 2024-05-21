import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/data/orders/data_source/orders_data_source.dart';
import 'package:just_ready/data/orders/mapper/order_dto_to_order_mapper.dart';
import 'package:just_ready/data/orders/mapper/order_to_order_dto_mapper.dart';
import 'package:just_ready/data/orders/models/order_dto.dart';
import 'package:just_ready/domain/main_stream/service/main_stream_service.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/models/order_meal.dart';
import 'package:just_ready/domain/orders/models/order_status.dart';
import 'package:just_ready/domain/orders/repository/orders_event.dart';
import 'package:just_ready/domain/orders/repository/orders_repository.dart';

const int maxOrderNumber = 99;

@LazySingleton(as: OrdersRepository)
class OrdersRepositoryImpl implements OrdersRepository {
  final MainStreamService _mainStreamService;
  final OrdersDataSource _ordersDataSource;
  final OrderToOrderDtoMapper _orderToOrderDtoMapper;
  final OrderDtoToOrderMapper _orderDtoToOrderMapper;

  Order? currentOrder;

  OrdersRepositoryImpl(
    this._ordersDataSource,
    this._orderToOrderDtoMapper,
    this._mainStreamService,
    this._orderDtoToOrderMapper,
  );

  @override
  Future<int> sendOrder(Order order) async {
    final orderNumber = await _getNewOrderNumber();
    final orderDto = _orderToOrderDtoMapper(order, orderNumber: orderNumber);
    await _ordersDataSource.sendOrder(orderDto);
    return orderNumber;
    // _mainStreamService.notifyRefreshStream(const ReorderEvent.updatedReorderProductsList());
  }

  Future<int> _getNewOrderNumber() async {
    int orderNumber = 1;
    final List<OrderDto> ordersDtos = await _ordersDataSource.getOrders();
    for (OrderDto orderDto in ordersDtos) {
      if (orderDto.number == null) continue;
      if (orderDto.number! >= orderNumber) {
        orderNumber = orderDto.number! + 1;
      }
    }
    // if more then maxOrderNumber chcek first closed order
    if (orderNumber >= maxOrderNumber) {
      for (int number = 1; number <= maxOrderNumber; number++) {
        if (!ordersDtos.any((orderDto) => orderDto.number == number)) return number;
      }
    }
    return orderNumber;
  }

  @override
  void clearCurrentOrder() async {
    currentOrder = null;
  }

  @override
  Future<void> addMealToCurrentOrder(Meal meal, int count) async {
    currentOrder ??= Order(
      number: null,
      orderMeals: [],
      note: '',
      status: OrderStatus.ordered,
      announcedReady: false,
    );

    for (var orderMeal in currentOrder!.orderMeals) {
      if (orderMeal.meal.number == meal.number) {
        orderMeal.count += count;
        _mainStreamService.notifyRefreshStream(const OrdersEvent.mealsAddToCurrentOrder());
        return;
      }
    }
    currentOrder!.orderMeals.add(OrderMeal(meal: meal, count: count, isDone: false));
    _mainStreamService.notifyRefreshStream(const OrdersEvent.mealsAddToCurrentOrder());
  }

  @override
  void addNoteCurrentOrder(String note) {
    currentOrder ??= Order(
      number: null,
      orderMeals: [],
      note: note,
      status: OrderStatus.ordered,
      announcedReady: false,
    );
    currentOrder!.note = note;
  }

  @override
  Order? getCurrentOrder() => currentOrder;

  @override
  void deleteCurrentOrderMeal(OrderMeal meal) {
    if (currentOrder == null) return;
    currentOrder!.orderMeals.remove(meal);
  }

  @override
  void editCurrentOrderMealCount(OrderMeal orderMeal, int count) {
    if (currentOrder == null) return;
    for (var meal in currentOrder!.orderMeals) {
      if (meal == orderMeal) {
        meal.count = count;
        return;
      }
    }
  }

  @override
  Future<void> editOrder(Order order, int oldNumber) async {
    final deletedOrdersDto = (await _ordersDataSource.getDeletedOrders());
    final List<Order> deletedOrders = deletedOrdersDto
        .map(
          (orderDto) => _orderDtoToOrderMapper(orderDto),
        )
        .toList(growable: false);
    var priceSum = 0.0;
    for (var deletedOrder in deletedOrders) {
      priceSum += deletedOrder.getSumPrice();
    }
    print(priceSum);

    final dto = _orderToOrderDtoMapper(order);

    await _ordersDataSource.editOrder(dto, oldNumber);
  }

  @override
  Future<void> deleteOrder(Order order) async {
    if (order.number != null) await _ordersDataSource.deleteOrder(order.number!);
    final dto = _orderToOrderDtoMapper(order);
    await _ordersDataSource.addToDeletedOrders(dto);
  }

  @override
  Stream<List<Order>> ordersStream() {
    final Stream<List<OrderDto>> orderDtoListStream = _ordersDataSource.orders();
    return orderDtoListStream.asyncMap(
      (orderDtos) async {
        final orders = orderDtos
            .map(
              (orderDto) async => _orderDtoToOrderMapper(orderDto),
            )
            .toList(growable: false);
        return await Future.wait(orders);
      },
    );
  }

  @override
  Stream<List<Order>> deletedOrdersStream() {
    final Stream<List<OrderDto>> orderDtoListStream = _ordersDataSource.deletedOrders();
    return orderDtoListStream.asyncMap(
      (orderDtos) async {
        final orders = orderDtos
            .map(
              (orderDto) async => _orderDtoToOrderMapper(orderDto),
            )
            .toList(growable: false);
        return await Future.wait(orders);
      },
    );
  }
}
