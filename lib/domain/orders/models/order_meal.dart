import 'package:just_ready/domain/meals/models/meal.dart';

class OrderMeal {
  final Meal meal;
  int count;
  bool isDone;

  OrderMeal({
    required this.meal,
    required this.count,
    required this.isDone,
  });
}
