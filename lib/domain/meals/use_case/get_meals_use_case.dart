import 'package:injectable/injectable.dart';
import 'package:just_ready/domain/meals/meals_repository.dart';
import 'package:just_ready/domain/meals/models/meal.dart';

@injectable
class GetMealsUseCase {
  final MealsRepository _mealsRepository;

  const GetMealsUseCase(this._mealsRepository);

  Future<List<Meal>> call() => _mealsRepository.meals();
}
