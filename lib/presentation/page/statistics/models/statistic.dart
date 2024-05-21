import 'package:just_ready/domain/orders/models/order_meal.dart';

class Statistic {
  final List<OrderMeal> orderMeals;

  Statistic({
    required this.orderMeals,
  });

  get price {
    double price = 0;
    for (var orderMeal in orderMeals) {
      price += orderMeal.price;
    }
    return price;
  }
}
