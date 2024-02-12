import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/orders/repository/orders_repository.dart';

@injectable
class ClearCurrentOrderUseCase {
  final OrdersRepository _ordersRepository;

  const ClearCurrentOrderUseCase(this._ordersRepository);

  void call() => _ordersRepository.clearCurrentOrder();
}
