import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/domain/meals/use_case/get_meals_use_case.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/use_case/add_maal_to_current_order_use_case.dart';
import 'package:just_ready/domain/orders/use_case/get_current_order_use_case.dart';
import 'package:just_ready/presentation/page/select_meals/cubit/select_meals_state.dart';

@injectable
class SelectMealsCubit extends Cubit<SelectMealsState> {
  final GetMealsUseCase _getMealsUseCase;
  final GetCurrentOrderUseCase _getCurrentOrderUseCase;
  final AddMealToCurrentOrderUseCase _addMealToCurrentOrderUseCase;

  List<Meal> _meals = [];
  Order? _currentOrder;

  SelectMealsCubit(
    this._getMealsUseCase,
    this._addMealToCurrentOrderUseCase,
    this._getCurrentOrderUseCase,
  ) : super(const SelectMealsState.loading());

  Future<void> init() async {
    _meals = await _getMealsUseCase();
    _currentOrder = _getCurrentOrderUseCase();
    emit(SelectMealsState.loaded(_meals, _currentOrder));
  }

  Future<void> addMealsToOrder(Meal meal, int count) async {
    emit(const SelectMealsState.idle());
    await _addMealToCurrentOrderUseCase(meal, count);
    _currentOrder = _getCurrentOrderUseCase();
    emit(SelectMealsState.loaded(_meals, _currentOrder));
  }
}
