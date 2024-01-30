import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/meals/models/meal.dart';

@injectable
class GetFreeMealNumberUseCase {
  const GetFreeMealNumberUseCase();

  int? call(List<Meal> meals) {
    for (int number = 1; number < 100; number++) {
      if (!meals.any((meal) => meal.mealNumber == number)) return number;
    }
    return null;
  }
}
