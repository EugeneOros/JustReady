import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/orders/models/order_meal.dart';
import 'package:just_ready/domain/orders/repository/orders_repository.dart';

@injectable
class DeleteCurrentOrderMealUseCase {
  final OrdersRepository _ordersRepository;

  const DeleteCurrentOrderMealUseCase(this._ordersRepository);

  void call(OrderMeal orderMeal) => _ordersRepository.deleteCurrentOrderMeal(orderMeal);
}
