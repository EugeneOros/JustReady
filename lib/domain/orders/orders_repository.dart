import 'package:just_ready/domain/orders/models/Order.dart';

abstract class OrdersRepository {
  Future<void> addOrder(Order order);

  Future<void> delete(Order order);

  Future<List<Order>> orders();
}
