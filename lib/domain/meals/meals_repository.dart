import 'package:just_ready/domain/meals/models/meal.dart';

abstract class MealsRepository {
  Future<void> addMeal(Meal meal);

  Future<void> editMeal(Meal meal);

  Future<void> deleteMeal(String mealId);

  Future<List<Meal>> meals();
}
