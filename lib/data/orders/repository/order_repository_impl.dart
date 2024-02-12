import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/data/orders/data_source/orders_data_source.dart';
import 'package:just_ready/data/orders/mapper/order_to_order_dto_mapper.dart';
import 'package:just_ready/data/orders/models/order_dto.dart';
import 'package:just_ready/domain/main_stream/service/main_stream_service.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/models/order_meal.dart';
import 'package:just_ready/domain/orders/repository/orders_event.dart';
import 'package:just_ready/domain/orders/repository/orders_repository.dart';

const int maxOrderNumber = 99;

@LazySingleton(as: OrdersRepository)
class OrdersRepositoryImpl implements OrdersRepository {
  final MainStreamService _mainStreamService;
  final OrdersDataSource _ordersDataSource;
  final OrderToOrderDtoMapper _orderToOrderDtoMapper;

  Order? currentOrder;

  OrdersRepositoryImpl(
    this._ordersDataSource,
    this._orderToOrderDtoMapper,
    this._mainStreamService,
  );

  @override
  Future<int> sendOrder(Order order) async {
    final orderNumber = await _getNewOrderNumber();
    final orderDto = _orderToOrderDtoMapper(order, orderNumber);
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
    currentOrder ??= Order(orderNumber: null, orderMeals: [], note: '');

    for (var orderMeal in currentOrder!.orderMeals) {
      if (orderMeal.meal.number == meal.number) {
        orderMeal.count += count;
        _mainStreamService.notifyRefreshStream(const OrdersEvent.mealsAddToCurrentOrder());
        return;
      }
    }
    currentOrder!.orderMeals.add(OrderMeal(meal: meal, count: count));
    _mainStreamService.notifyRefreshStream(const OrdersEvent.mealsAddToCurrentOrder());
  }

  @override
  void addNoteCurrentOrder(String note) {
    currentOrder ??= Order(orderNumber: null, orderMeals: [], note: note);
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
  void editOrderMealCount(OrderMeal orderMeal, int count) {
    if (currentOrder == null) return;
    for (var meal in currentOrder!.orderMeals) {
      if (meal == orderMeal) {
        meal.count = count;
        return;
      }
    }
  }

  @override
  Future<void> delete(Order reorderProduct) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Order>> orders() {
    // TODO: implement orders
    throw UnimplementedError();
  }

  // @override
  // Stream<List<Order>> orders() {
  //   final Stream<List<EventEntityDto>> eventDtoListStream = _ordersDataSource.events(status);
  //   return eventDtoListStream.asyncMap(
  //     (eventDtoList) async {
  //       final eventList = eventDtoList
  //           .map(
  //             (eventDto) async => _eventDtoToEventMapper(
  //               eventDto,
  //               advertisement: await _getAdvertisement(eventDto.mainSponsor, eventDto.id),
  //             ),
  //           )
  //           .toList(growable: false);
  //       return await Future.wait(eventList);
  //     },
  //   );
  // }
}
