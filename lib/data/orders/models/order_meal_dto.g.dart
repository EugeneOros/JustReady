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
      selectedAddons: (json['selectedAddons'] as List<dynamic>?)
          ?.map((e) => MealAddonDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderMealDtoToJson(OrderMealDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      'mealDto': instance.mealDto.toJson(),
      'isDone': instance.isDone,
      'selectedAddons': instance.selectedAddons?.map((e) => e.toJson()).toList(),
    };
