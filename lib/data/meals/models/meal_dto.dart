import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_dto.g.dart';

@JsonSerializable()
class MealDto {
  final String name;
  final int number;
  final double price;
  final double? doublePrice;

  const MealDto({
    required this.name,
    required this.number,
    required this.price,
    this.doublePrice,
  });

  Map<String, dynamic> toJson() => _$MealDtoToJson(this);

  factory MealDto.fromJson(Map<String, dynamic> json) => _$MealDtoFromJson(json);
}
