import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/models/order_meal.dart';

abstract class OrdersRepository {
  Future<int> sendOrder(Order order);

  Future<void> editOrder(Order order, int oldNumber);

  Future<void> deleteOrder(Order order);

  Future<void> addMealToCurrentOrder(Meal meal, int count);

  void editCurrentOrderMealCount(OrderMeal meal, int count);

  Order? getCurrentOrder();

  void addNoteCurrentOrder(String note);

  void deleteCurrentOrderMeal(OrderMeal meal);

  void clearCurrentOrder();

  Stream<List<Order>> ordersStream();
}
