import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/repository/orders_repository.dart';

@injectable
class GetOrdersStreamUseCase {
  final OrdersRepository _ordersRepository;

  const GetOrdersStreamUseCase(this._ordersRepository);

 Stream<List<Order>> call() => _ordersRepository.ordersStream();
}
