import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_ready/domain/orders/models/order.dart';

part 'orders_state.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  @Implements<OrdersStateBuilder>()
  const factory OrdersState.loaded(List<Order> orders, Order? orderToDelete, int deletionCountdownValue) =
      OrdersStateLoadingLoaded;

  @Implements<OrdersStateBuilder>()
  const factory OrdersState.loadedEmpty() = OrdersStateLoadingLoadedEmpty;

  @Implements<OrdersStateBuilder>()
  const factory OrdersState.loading() = OrdersStateLoading;

  @Implements<OrdersStateBuilder>()
  const factory OrdersState.error(Object error) = OrdersStateLoadingError;
  
  const factory OrdersState.idle() = OrdersStateLoadingIdle;
}

abstract class OrdersStateBuilder {}

abstract class OrdersStateListener {}
