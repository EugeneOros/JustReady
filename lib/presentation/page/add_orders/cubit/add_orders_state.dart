import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_orders_state.freezed.dart';

@freezed
class AddOrdersState with _$AddOrdersState {
  const factory AddOrdersState.loaded() = AddOrdersStateLoaded;
  const factory AddOrdersState.loading() = AddOrdersStateLoading;
  const factory AddOrdersState.error(Object error) = AddOrdersStateError;
  const factory AddOrdersState.initial() = AddOrdersStateInitial;
}
