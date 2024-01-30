import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDto {
  final String id;
  final String note;

  const OrderDto({
    required this.id,
    required this.note,
  });

  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);

  factory OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);
}
