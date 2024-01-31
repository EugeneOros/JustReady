import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/domain/meals/use_case/get_meals_use_case.dart';
import 'package:just_ready/domain/orders/models/Order.dart';
import 'package:just_ready/domain/orders/use_case/add_order_use_case.dart';
import 'package:just_ready/presentation/page/add_orders/cubit/add_orders_state.dart';
import 'package:just_ready/utils/logger.dart';

@injectable
class AddOrdersCubit extends Cubit<AddOrdersState> {
  final AddOrderUseCase _addOrderUseCase;
  final GetMealsUseCase _getMealsUseCase;

  List<Meal> meals = [];
  AddOrdersCubit(
    this._addOrderUseCase,
    this._getMealsUseCase,
  ) : super(const AddOrdersState.loading());

  Future<void> init() async {
    meals = await _getMealsUseCase();
    emit(AddOrdersState.loaded(meals));
  }

  Future<void> addOrder() async {
    logger.i('adding to order');
    await _addOrderUseCase(Order(
      id: '1',
      orderNumber: 12,
      note: '',
      mealNumbersMap: {},
    ));
  }
}
