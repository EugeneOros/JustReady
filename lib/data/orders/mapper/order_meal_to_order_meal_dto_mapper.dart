import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/data/meals/mapper/meal_to_meal_dto_mapper.dart';
import 'package:just_ready/data/orders/models/order_meal_dto.dart';
import 'package:just_ready/domain/orders/models/order_meal.dart';

@injectable
class OrderMealToOrderMealDtoMapper {
  final MealToMealDtoMapper _mealToMealDtoMapper;
  OrderMealToOrderMealDtoMapper(this._mealToMealDtoMapper);

  OrderMealDto call(OrderMeal orderMeal) => OrderMealDto(
        count: orderMeal.count,
        mealDto: _mealToMealDtoMapper(orderMeal.meal),
      );
}
