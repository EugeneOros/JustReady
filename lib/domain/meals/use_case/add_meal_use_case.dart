import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/meals/meals_repository.dart';
import 'package:just_ready/domain/meals/models/meal.dart';

@injectable
class AddMealUseCase {
  final MealsRepository _mealsRepository;

  const AddMealUseCase(this._mealsRepository);

  Future<void> call(Meal meal) => _mealsRepository.addMeal(meal);
}
