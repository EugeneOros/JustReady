import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/domain/meals/models/meal_addon.dart';

class OrderMeal {
  final Meal meal;
  int count;
  bool isDone;
  final List<MealAddon> selectedAddons;

  OrderMeal({
    required this.meal,
    required this.count,
    required this.isDone,
    this.selectedAddons = const [],
  });

  get price {
    final addonPrice = selectedAddons.fold(0.0, (sum, a) => sum + a.price);
    double price = 0;
    if (meal.doublePrice != null) {
      int doubledMealsCount = (count / 2).floor();
      int singleMealCount = count % 2;
      price += doubledMealsCount * meal.doublePrice!;
      price += singleMealCount * meal.price;
    } else {
      price = count * meal.price;
    }
    return price + addonPrice * count;
  }
}
