import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_card_state.freezed.dart';

@freezed
class OrderCardState with _$OrderCardState {
  @Implements<OrderCardStateBuilder>()
  const factory OrderCardState.loaded({required bool showCountdown, required int countdown}) = Loaded;

  @Implements<OrderCardStateListener>()
  const factory OrderCardState.deleteOrder() = DeleteOrder;

  @Implements<OrderCardStateBuilder>()
  const factory OrderCardState.idle() = Idle;
}

abstract class OrderCardStateBuilder {}

abstract class OrderCardStateListener {}
