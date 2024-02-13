import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_ready/domain/orders/models/order.dart';

part 'orders_state.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.loaded(List<Order> orders) = Loaded;
  const factory OrdersState.loadedEmpty() = LoadedEmpty;
  const factory OrdersState.loading() = Loading;
  const factory OrdersState.error(Object error) = Error;
  const factory OrdersState.initial() = Initial;
}
