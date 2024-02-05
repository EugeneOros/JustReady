import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/domain/orders/models/order.dart';

abstract class OrdersRepository {
  Future<void> addOrder(Order order);

  Future<void> delete(Order order);

  Future<List<Order>> orders();

  void addMealToCurrentOrder(Meal meal, int count);

  Order? getCurrentOrder();

  void addNoteCurrentOrder(String note);
}
