import 'package:just_ready/domain/meals/models/meal.dart';

abstract class MealsRepository {
  Future<void> addMeal(Meal meal);

  Future<void> editMeal(Meal meal, int oldNumber);

  Future<void> deleteMeal(int mealNumber);

  Future<List<Meal>> meals();
}
