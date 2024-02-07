import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/models/order_meal.dart';

abstract class OrdersRepository {
  Future<void> addOrder(Order order);

  Future<void> delete(Order order);

  Future<List<Order>> orders();

  Future<void> addMealToCurrentOrder(Meal meal, int count);

  void editOrderMealCount(OrderMeal meal, int count);

  Order? getCurrentOrder();

  void addNoteCurrentOrder(String note);

  void deleteCurrentOrderMeal(OrderMeal meal);
}
