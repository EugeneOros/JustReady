import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/domain/meals/use_case/add_meal_use_case.dart';
import 'package:just_ready/domain/meals/use_case/delete_meal_use_case.dart';
import 'package:just_ready/domain/meals/use_case/edit_meal_use_case.dart';
import 'package:just_ready/domain/meals/use_case/get_free_meal_number_use_case.dart';
import 'package:just_ready/domain/meals/use_case/is_meal_number_taken_use_case.dart';
import 'package:just_ready/domain/meals/use_case/get_meals_use_case.dart';
import 'package:just_ready/presentation/page/meals/cubit/meals_state.dart';
import 'package:just_ready/utils/logger.dart';

@injectable
class MealsCubit extends Cubit<MealsState> {
  final AddMealUseCase _addMealUseCase;
  final EditMealUseCase _editMealUseCase;
  final GetMealsUseCase _getMealsUseCase;
  final DeleteMealUseCase _deleteMealUseCase;
  final GetFreeMealNumberUseCase _getFreeMealNumberUseCase;
  final IsMealNumberTakenUseCase _isMealNumberTakenUseCase;

  List<Meal> meals = [];

  MealsCubit(
    this._addMealUseCase,
    this._editMealUseCase,
    this._getMealsUseCase,
    this._deleteMealUseCase,
    this._getFreeMealNumberUseCase,
    this._isMealNumberTakenUseCase,
  ) : super(const MealsState.loading());

  Future<void> init() async {
    meals = await _getMealsUseCase();
    emit(MealsState.loaded(meals));
  }

  Future<void> deleteMeal(String mealId) async {
    await _deleteMealUseCase(mealId);
    await _emmitLoaded();
  }

  int? getFreeMealNumber() => _getFreeMealNumberUseCase(meals);

  bool isMealNumberTaken(int mealNumber) => _isMealNumberTakenUseCase(meals, mealNumber);

  Future<void> addMeal() async {
    logger.i('adding to meal');
    await _addMealUseCase(
      Meal(
        id: '1',
        name: 'Croisant',
        mealNumber: 12,
        price: 13.45,
      ),
    );
  }

  Future<void> createEditMeal(meal) async {
    emit(const MealsState.idle());
    if (!meals.any((m) => m.id == meal.id)) {
      await _addMealUseCase(meal);
    } else {
      await _editMealUseCase(meal);
    }

    await _emmitLoaded();
  }

  Future<void> _emmitLoaded() async {
    meals = await _getMealsUseCase();
    emit(MealsState.loaded(meals));
  }
}
