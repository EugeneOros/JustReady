import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/orders/models/order_meal.dart';
import 'package:just_ready/domain/orders/repository/orders_repository.dart';

@injectable
class EditCurrentOrderMealCountUseCase {
  final OrdersRepository _ordersRepository;

  const EditCurrentOrderMealCountUseCase(this._ordersRepository);

  void call(OrderMeal orderMeal, int count) => _ordersRepository.editCurrentOrderMealCount(orderMeal, count);
}
