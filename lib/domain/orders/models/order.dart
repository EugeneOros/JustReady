import 'package:just_ready/domain/orders/models/order_meal.dart';

class Order {
  final String? id;
  final int? orderNumber;
  final List<OrderMeal> meals;
  String note;

  Order({
    required this.id,
    required this.orderNumber,
    required this.meals,
    required this.note,
  });

  double getSumPrice() {
    double sumPrice = 0;
    for (var orderMeal in meals) {
      sumPrice += orderMeal.meal.price;
    }
    return sumPrice;
  }
}
