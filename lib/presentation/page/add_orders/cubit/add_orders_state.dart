import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_ready/domain/meals/models/meal.dart';

part 'add_orders_state.freezed.dart';

@freezed
class AddOrdersState with _$AddOrdersState {
  const factory AddOrdersState.loaded(List<Meal> meals) = AddOrdersStateLoaded;
  const factory AddOrdersState.loading() = AddOrdersStateLoading;
  const factory AddOrdersState.error(Object error) = AddOrdersStateError;
  const factory AddOrdersState.initial() = AddOrdersStateInitial;
}
