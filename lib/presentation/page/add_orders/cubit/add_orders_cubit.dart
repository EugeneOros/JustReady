import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/orders/models/Order.dart';
import 'package:just_ready/domain/orders/use_case/add_order_use_case.dart';
import 'package:just_ready/presentation/page/add_orders/cubit/add_orders_state.dart';
import 'package:just_ready/utils/logger.dart';

@injectable
class AddOrdersCubit extends Cubit<AddOrdersState> {
  final AddOrderUseCase addOrderUseCase;

  AddOrdersCubit(
    this.addOrderUseCase,
  ) : super(const AddOrdersState.loading());

  void init() {
    emit(const AddOrdersState.loaded());
  }

  Future<void> addOrder() async {
    logger.i('adding to order');
    await addOrderUseCase(Order(
      id: '1',
      orderNumber: 12,
      note: '',
      mealNumbersMap: {},
    ));
  }
}
