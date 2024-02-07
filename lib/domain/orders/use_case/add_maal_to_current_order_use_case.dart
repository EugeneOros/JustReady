import 'package:injectable/injectable.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/domain/orders/repository/orders_repository.dart';

@injectable
class AddMealToCurrentOrderUseCase {
  final OrdersRepository _ordersRepository;

  const AddMealToCurrentOrderUseCase(this._ordersRepository);

  Future<void> call(Meal meal, int count) => _ordersRepository.addMealToCurrentOrder(meal, count);
}
