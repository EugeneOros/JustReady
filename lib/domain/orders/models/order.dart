import 'package:just_ready/domain/orders/models/order_meal.dart';

class Order {
  final int? orderNumber;
  final List<OrderMeal> orderMeals;
  String note;
  final DateTime? createdDate;

  Order({
    required this.orderNumber,
    required this.orderMeals,
    required this.note,
    this.createdDate,
  });

  double getSumPrice() {
    double sumPrice = 0;
    for (var orderMeal in orderMeals) {
      sumPrice += orderMeal.meal.price * orderMeal.count;
    }
    return sumPrice;
  }
}
