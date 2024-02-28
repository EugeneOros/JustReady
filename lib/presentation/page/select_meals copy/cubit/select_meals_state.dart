import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_ready/domain/meals/models/meal.dart';

part 'select_meals_state.freezed.dart';

@freezed
class SelectMealsState with _$SelectMealsState {
  @Implements<SelectMealsStateBuilder>()
  const factory SelectMealsState.loaded(List<Meal> meals) = Loaded;

  @Implements<SelectMealsStateBuilder>()
  const factory SelectMealsState.loading() = Loading;

  @Implements<SelectMealsStateListener>()
  const factory SelectMealsState.showMealAddedSnackBar() = ShowMealAddedSnackBar;

  @Implements<SelectMealsStateListener>()
  const factory SelectMealsState.showErrorSnackBar() = ShowErrorSnackBar;

  @Implements<SelectMealsStateBuilder>()
  const factory SelectMealsState.error(Object error) = Error;

    const factory SelectMealsState.idle() = Idle;
}

abstract class SelectMealsStateListener {}

abstract class SelectMealsStateBuilder {}
