import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/data/orders/data_source/orders_data_source.dart';
import 'package:just_ready/data/orders/mapper/order_to_order_dto_mapper.dart';
import 'package:just_ready/domain/orders/models/Order.dart';
import 'package:just_ready/domain/orders/orders_repository.dart';

@LazySingleton(as: OrdersRepository)
class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersDataSource _ordersDataSource;
  final OrderToOrderDtoMapper _orderToOrderDtoMapper;

  OrdersRepositoryImpl(
    this._ordersDataSource,
    this._orderToOrderDtoMapper,
  );

  @override
  Future<void> addOrder(Order order) async {
    final orderDto = _orderToOrderDtoMapper(order);

    _ordersDataSource.addOrder(orderDto);
    // _mainStreamService.notifyRefreshStream(const ReorderEvent.updatedReorderProductsList());
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
