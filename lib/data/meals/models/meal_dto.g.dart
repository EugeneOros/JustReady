// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealDto _$MealDtoFromJson(Map<String, dynamic> json) => MealDto(
      id: json['id'] as String,
      name: json['name'] as String,
      mealNumber: json['mealNumber'] as int,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$MealDtoToJson(MealDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mealNumber': instance.mealNumber,
      'price': instance.price,
    };
