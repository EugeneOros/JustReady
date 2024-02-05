import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_ready/domain/main_stream/model/main_event.dart';

part 'orders_event.freezed.dart';

@freezed
class OrdersEvent extends MainStreamEvent with _$OrdersEvent {
  const factory OrdersEvent.mealsAddToCurrentOrder() = MealsAddToCurrentOrder;
}
