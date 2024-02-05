import 'package:just_ready/domain/meals/models/meal.dart';

class OrderMeal {
  final Meal meal;
  int count;

  OrderMeal({
    required this.meal,
    required this.count,
  });
}
