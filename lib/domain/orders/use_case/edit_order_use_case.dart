import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/repository/orders_repository.dart';

@injectable
class EditOrderUseCase {
  final OrdersRepository _ordersRepository;

  const EditOrderUseCase(this._ordersRepository);

  Future<void> call(Order order, {int? oldNumber}) => _ordersRepository.editOrder(order, oldNumber ?? order.number!);
}
