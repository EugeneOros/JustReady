import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/domain/meals/use_case/get_meals_use_case.dart';
import 'package:just_ready/domain/orders/use_case/add_maal_to_current_order_use_case.dart';
import 'package:just_ready/presentation/page/select_meals/cubit/select_meals_state.dart';

@injectable
class SelectMealsCubit extends Cubit<SelectMealsState> {
  final GetMealsUseCase _getMealsUseCase;
  final AddMealToCurrentOrderUseCase _addMealToCurrentOrderUseCase;

  List<Meal> meals = [];
  SelectMealsCubit(
    this._getMealsUseCase,
    this._addMealToCurrentOrderUseCase,
  ) : super(const SelectMealsState.loading());

  Future<void> init() async {
    meals = await _getMealsUseCase();
    emit(SelectMealsState.loaded(meals));
  }

  Future<void> addMealsToOrder(Meal meal, int count) async {
    await _addMealToCurrentOrderUseCase(meal, count);
  }
}
