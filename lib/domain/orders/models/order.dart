import 'package:just_ready/domain/orders/models/order_meal.dart';
import 'package:just_ready/domain/orders/models/order_status.dart';

class Order {
  final int? number;
  final List<OrderMeal> orderMeals;
  String note;
  final DateTime? createdDate;
  final OrderStatus status;
  final bool announcedReady;

  Order({
    required this.number,
    required this.orderMeals,
    required this.note,
    this.createdDate,
    required this.status,
    required this.announcedReady,
  });

  Order copyWith({
    int? number,
    List<OrderMeal>? orderMeals,
    String? note,
    DateTime? createdDate,
    OrderStatus? status,
    bool? announcedReady,
  }) =>
      Order(
        number: number ?? this.number,
        orderMeals: orderMeals ?? this.orderMeals,
        note: note ?? this.note,
        createdDate: createdDate ?? this.createdDate,
        status: status ?? this.status,
        announcedReady: announcedReady ?? this.announcedReady,
      );

  double getSumPrice() {
    double sumPrice = 0;
    for (var orderMeal in orderMeals) {
      sumPrice += orderMeal.meal.price * orderMeal.count;
    }
    return sumPrice;
  }
}
