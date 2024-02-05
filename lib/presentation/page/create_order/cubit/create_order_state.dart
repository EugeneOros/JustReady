import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_ready/domain/orders/models/order.dart';

part 'create_order_state.freezed.dart';

@freezed
class CreateOrderState with _$CreateOrderState {
  const factory CreateOrderState.loaded(Order order) = Loaded;
  const factory CreateOrderState.loadedEmpty() = LoadedEmpty;
  const factory CreateOrderState.loading() = Loading;
  const factory CreateOrderState.error(Object error) = Error;
  const factory CreateOrderState.initial() = Initial;
}
