import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_ready/domain/meals/models/meal.dart';

part 'meals_state.freezed.dart';

@freezed
class MealsState with _$MealsState {
  const factory MealsState.loaded(List<Meal> meals) = MealsStateLoaded;
  const factory MealsState.loading() = MealsStateLoading;
  const factory MealsState.error(Object error) = MealsStateError;
  const factory MealsState.initial() = MealsStateInitial;
}
