import 'package:injectable/injectable.dart';
import 'package:just_ready/domain/orders/repository/orders_repository.dart';

@injectable
class AddNoteToCurrentOrderUseCase {
  final OrdersRepository _ordersRepository;

  const AddNoteToCurrentOrderUseCase(this._ordersRepository);

  void call(String note) => _ordersRepository.addNoteCurrentOrder(note);
}
