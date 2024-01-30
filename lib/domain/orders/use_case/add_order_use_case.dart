import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/orders/models/Order.dart';
import 'package:just_ready/domain/orders/orders_repository.dart';

@injectable
class AddOrderUseCase {
  final OrdersRepository _ordersRepository;

  const AddOrderUseCase(this._ordersRepository);

  Future<void> call(Order order) => _ordersRepository.addOrder(order);
}
