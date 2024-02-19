import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/repository/orders_repository.dart';

@injectable
class DeleteOrderUseCase {
  final OrdersRepository _ordersRepository;

  const DeleteOrderUseCase(this._ordersRepository);

  Future<void> call(Order order) async => await _ordersRepository.deleteOrder(order);
}
