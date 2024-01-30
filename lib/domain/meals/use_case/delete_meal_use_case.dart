import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/meals/meals_repository.dart';

@injectable
class DeleteMealUseCase {
  final MealsRepository _mealsRepository;

  const DeleteMealUseCase(this._mealsRepository);

  Future<void> call(String mealId) => _mealsRepository.deleteMeal(mealId);
}
