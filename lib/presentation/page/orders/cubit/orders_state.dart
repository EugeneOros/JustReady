import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_ready/domain/orders/models/order.dart';

part 'orders_state.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.loaded(List<Order> orders) =OrdersStateLoadingLoaded;
  const factory OrdersState.loadedEmpty() = OrdersStateLoadingLoadedEmpty;
  const factory OrdersState.loading() = OrdersStateLoading;
  const factory OrdersState.error(Object error) = OrdersStateLoadingError;
  const factory OrdersState.idle() = OrdersStateLoadingIdle;
}
