import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_dto.g.dart';

@JsonSerializable()
class MealDto {
  final String id;
  final String name;
  final int mealNumber;
  final double price;

  const MealDto({
    required this.id,
    required this.name,
    required this.mealNumber,
    required this.price,
  });

  Map<String, dynamic> toJson() => _$MealDtoToJson(this);

  factory MealDto.fromJson(Map<String, dynamic> json) => _$MealDtoFromJson(json);
}
