import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/data/orders/data_source/orders_data_source.dart';
import 'package:just_ready/data/orders/mapper/order_to_order_dto_mapper.dart';
import 'package:just_ready/domain/main_stream/service/main_stream_service.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/models/order_meal.dart';
import 'package:just_ready/domain/orders/repository/orders_event.dart';
import 'package:just_ready/domain/orders/repository/orders_repository.dart';

@LazySingleton(as: OrdersRepository)
class OrdersRepositoryImpl implements OrdersRepository {
  final MainStreamService _mainStreamService;
  final OrdersDataSource _ordersDataSource;
  final OrderToOrderDtoMapper _orderToOrderDtoMapper;

  //Todo: delete when end testing
  // Order? currentOrder;
  Order? currentOrder = Order(
    id: null,
    orderNumber: null,
    meals: [
      OrderMeal(
        meal: Meal(
          id: '1',
          name: "Kurczak Curry z ryem basmati",
          mealNumber: 3,
          price: 34,
        ),
        count: 3,
      ),
      OrderMeal(
        meal: Meal(
          id: '2',
          name: "Kurczak Curry z pyzami",
          mealNumber: 3,
          price: 34,
        ),
        count: 3,
      ),
      OrderMeal(
        meal: Meal(
          id: '3',
          name: "Kurczak Curry z ryem kakuni",
          mealNumber: 3,
          price: 34,
        ),
        count: 3,
      ),
      OrderMeal(
        meal: Meal(
          id: '4',
          name: "Kurczak Curry z ryem sabuni",
          mealNumber: 3,
          price: 34,
        ),
        count: 3,
      ),
    ],
    note: '',
  );

  OrdersRepositoryImpl(
    this._ordersDataSource,
    this._orderToOrderDtoMapper,
    this._mainStreamService,
  );

  @override
  Future<void> addOrder(Order order) async {
    final orderDto = _orderToOrderDtoMapper(order);

    _ordersDataSource.addOrder(orderDto);
    // _mainStreamService.notifyRefreshStream(const ReorderEvent.updatedReorderProductsList());
  }

  @override
  Future<void> addMealToCurrentOrder(Meal meal, int count) async {
    currentOrder ??= Order(id: null, orderNumber: null, meals: [], note: '');

    for (var orderMeal in currentOrder!.meals) {
      if (orderMeal.meal.id == meal.id) {
        orderMeal.count += count;
        _mainStreamService.notifyRefreshStream(const OrdersEvent.mealsAddToCurrentOrder());
        return;
      }
    }
    currentOrder!.meals.add(OrderMeal(meal: meal, count: count));
    _mainStreamService.notifyRefreshStream(const OrdersEvent.mealsAddToCurrentOrder());
  }

  @override
  void addNoteCurrentOrder(String note) {
    currentOrder ??= Order(id: null, orderNumber: null, meals: [], note: note);
    currentOrder!.note = note;
  }

  @override
  Order? getCurrentOrder() => currentOrder;

  @override
  void deleteCurrentOrderMeal(OrderMeal meal) {
    if (currentOrder == null) return;
    currentOrder!.meals.remove(meal);
  }

  @override
  void editOrderMealCount(OrderMeal orderMeal, int count) {
    if (currentOrder == null) return;
    for (var meal in currentOrder!.meals) {
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
