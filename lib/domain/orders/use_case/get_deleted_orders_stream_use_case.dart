import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/repository/orders_repository.dart';

@injectable
class GetDeletedOrdersStreamUseCase {
  final OrdersRepository _ordersRepository;

  const GetDeletedOrdersStreamUseCase(this._ordersRepository);

 Stream<List<Order>> call() => _ordersRepository.deletedOrdersStream();
}
