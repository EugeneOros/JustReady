import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/meals/meals_repository.dart';
import 'package:just_ready/domain/meals/models/meal.dart';

@injectable
class EditMealUseCase {
  final MealsRepository _mealsRepository;

  const EditMealUseCase(this._mealsRepository);

  Future<void> call(Meal meal, int oldMealNumber) => _mealsRepository.editMeal(meal, oldMealNumber);
}
