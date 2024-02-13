import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_ready/data/meals/models/meal_dto.dart';

part 'order_meal_dto.g.dart';

@JsonSerializable()
class OrderMealDto {
  final int count;
  final MealDto mealDto;
  final bool isDone;

  const OrderMealDto({
    required this.count,
    required this.mealDto,
    required this.isDone,
  });

  Map<String, dynamic> toJson() => _$OrderMealDtoToJson(this);

  factory OrderMealDto.fromJson(Map<String, dynamic> json) => _$OrderMealDtoFromJson(json);
}
