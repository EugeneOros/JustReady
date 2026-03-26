// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_meal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderMealDto _$OrderMealDtoFromJson(Map json) => OrderMealDto(
      count: json['count'] as int,
      mealDto:
          MealDto.fromJson(Map<String, dynamic>.from(json['mealDto'] as Map)),
      isDone: json['isDone'] as bool,
    );

Map<String, dynamic> _$OrderMealDtoToJson(OrderMealDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      'mealDto': instance.mealDto.toJson(),
      'isDone': instance.isDone,
    };
