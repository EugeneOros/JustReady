// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealDto _$MealDtoFromJson(Map json) => MealDto(
      name: json['name'] as String,
      number: json['number'] as int,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$MealDtoToJson(MealDto instance) => <String, dynamic>{
      'name': instance.name,
      'number': instance.number,
      'price': instance.price,
    };
