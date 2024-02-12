import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/data/meals/mapper/meal_dto_to_meal_mapper.dart';
import 'package:just_ready/data/orders/models/order_meal_dto.dart';
import 'package:just_ready/domain/orders/models/order_meal.dart';

@injectable
class OrderMealDtoToOrderMealMapper {
  final MealDtoToMealMapper _mealDtoToMealMapper;
  OrderMealDtoToOrderMealMapper(this._mealDtoToMealMapper);

  OrderMeal call(OrderMealDto dto) => OrderMeal(
        count: dto.count,
        meal: _mealDtoToMealMapper(dto.mealDto),
      );
}
