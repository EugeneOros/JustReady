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

  get price {
    double price = 0;
    if (meal.doublePrice != null) {
      int doubledMealsCount = (count / 2).floor();
      int singleMealCount = count % 2;
      price += doubledMealsCount * meal.doublePrice!;
      price += singleMealCount * meal.price;
    } else {
      price = count * meal.price;
    }
    return price;
  }
}
