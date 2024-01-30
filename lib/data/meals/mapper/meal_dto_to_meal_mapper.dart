import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/data/meals/models/meal_dto.dart';
import 'package:just_ready/domain/meals/models/meal.dart';

@injectable
class MealDtoToMealMapper {
  MealDtoToMealMapper();

  Meal call(MealDto dto) => Meal(
        id: dto.id,
        name: dto.name,
        mealNumber: dto.mealNumber,
        price: dto.price,
      );
}
