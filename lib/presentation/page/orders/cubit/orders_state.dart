import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_state.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.loaded() = AddOrdersStateLoaded;
  const factory OrdersState.loading() = AddOrdersStateLoading;
  const factory OrdersState.error(Object error) = AddOrdersStateError;
  const factory OrdersState.initial() = AddOrdersStateInitial;
}
