import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/repository/orders_repository.dart';

@injectable
class GetCurrentOrderUseCase {
  final OrdersRepository _ordersRepository;

  const GetCurrentOrderUseCase(this._ordersRepository);

  Order? call() => _ordersRepository.getCurrentOrder();
}
