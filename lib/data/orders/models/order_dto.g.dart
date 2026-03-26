// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDto _$OrderDtoFromJson(Map json) => OrderDto(
      note: json['note'] as String,
      number: json['number'] as int?,
      orderMeals: (json['orderMeals'] as List<dynamic>)
          .map(
              (e) => OrderMealDto.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      createdDate: FirestoreTimestampMapper.fromJson(json['createdDate']),
      announcedReady: json['announcedReady'] as bool,
      status: json['status'] as String,
    );

Map<String, dynamic> _$OrderDtoToJson(OrderDto instance) => <String, dynamic>{
      'number': instance.number,
      'note': instance.note,
      'orderMeals': instance.orderMeals.map((e) => e.toJson()).toList(),
      'announcedReady': instance.announcedReady,
      'status': instance.status,
      'createdDate': FirestoreTimestampMapper.toJson(instance.createdDate),
    };
