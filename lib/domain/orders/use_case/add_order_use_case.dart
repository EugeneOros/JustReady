import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/repository/orders_repository.dart';

@injectable
class AddOrderUseCase {
  final OrdersRepository _ordersRepository;

  const AddOrderUseCase(this._ordersRepository);

  Future<void> call(Order order) => _ordersRepository.addOrder(order);
}
