import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_ready/domain/meals/models/meal.dart';

part 'select_meals_state.freezed.dart';

@freezed
class SelectMealsState with _$SelectMealsState {
  const factory SelectMealsState.loaded(List<Meal> meals) = Loaded;
  const factory SelectMealsState.loading() = Loading;
  const factory SelectMealsState.error(Object error) = Error;
  const factory SelectMealsState.initial() = Initial;
}
