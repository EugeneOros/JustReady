import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_ready/data/orders/models/order_meal_dto.dart';
import 'package:just_ready/utils/mapper/firestore_timestamp_mapper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDto {
  final int? number;
  final String note;
  final List<OrderMealDto> orderMeals;
  @JsonKey(
    fromJson: FirestoreTimestampMapper.fromJson,
    toJson: FirestoreTimestampMapper.toJson,
  )
  final Timestamp createdDate;

  const OrderDto({
    required this.note,
    required this.number,
    required this.orderMeals,
    required this.createdDate,
  });

  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);

  factory OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);
}
