import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_ready/domain/meals/models/meal.dart';

part 'meals_state.freezed.dart';

@freezed
class MealsState with _$MealsState {
  @Implements<MealsStateBuilder>()
  const factory MealsState.loaded(List<Meal> meals) = MealsStateLoaded;

  @Implements<MealsStateBuilder>()
  const factory MealsState.loading() = MealsStateLoading;

  @Implements<MealsStateBuilder>()
  const factory MealsState.error(Object error) = MealsStateError;

  const factory MealsState.idle() = MealsStateIdle;
}

abstract class MealsStateBuilder {}

abstract class MealsStateListener {}
