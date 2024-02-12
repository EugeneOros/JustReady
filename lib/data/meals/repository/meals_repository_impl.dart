import 'package:injectable/injectable.dart';
import 'package:just_ready/data/meals/data_source/meal_data_source.dart';
import 'package:just_ready/data/meals/mapper/meal_dto_to_meal_mapper.dart';
import 'package:just_ready/data/meals/mapper/meal_to_meal_dto_mapper.dart';
import 'package:just_ready/data/meals/models/meal_dto.dart';
import 'package:just_ready/domain/meals/meals_repository.dart';
import 'package:just_ready/domain/meals/models/meal.dart';

@LazySingleton(as: MealsRepository)
class MealsRepositoryImpl implements MealsRepository {
  final MealsDataSource _mealsDataSource;
  final MealToMealDtoMapper _mealToMealDtoMapper;
  final MealDtoToMealMapper _mealDtoToMealMapper;

  MealsRepositoryImpl(
    this._mealsDataSource,
    this._mealToMealDtoMapper,
    this._mealDtoToMealMapper,
  );

  @override
  Future<void> addMeal(Meal meal) async {
    final dto = _mealToMealDtoMapper(meal);

    await _mealsDataSource.addMeal(dto);
  }

  @override
  Future<void> editMeal(Meal meal, int oldNumber) async {
    final dto = _mealToMealDtoMapper(meal);

    await _mealsDataSource.editMeal(dto, oldNumber);
  }

  @override
  Future<void> deleteMeal(int mealNumber) async {
    await _mealsDataSource.deleteMeal(mealNumber);
  }

  @override
  Future<List<Meal>> meals() async {
    List<MealDto> dtos = await _mealsDataSource.getMeals();
    dtos.sort((a, b) => a.number.compareTo(b.number));
    return dtos.map((dto) => _mealDtoToMealMapper(dto)).toList(growable: false);
  }
}
