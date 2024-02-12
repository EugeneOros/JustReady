import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/data/meals/models/meal_dto.dart';
import 'package:just_ready/domain/meals/models/meal.dart';

@injectable
class MealToMealDtoMapper {
  MealToMealDtoMapper();

  MealDto call(Meal meal) => MealDto(
        name: meal.name,
        number: meal.number,
        price: meal.price,
      );
}
