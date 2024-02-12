import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/meals/models/meal.dart';

@injectable
class IsMealNumberTakenUseCase {
  const IsMealNumberTakenUseCase();

  bool call(List<Meal> meals, int number) {
    return meals.any((meal) => meal.number == number);
  }
}
