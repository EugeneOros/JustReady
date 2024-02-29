import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_ready/domain/orders/models/order.dart';

part 'create_order_state.freezed.dart';

@freezed
class CreateOrderState with _$CreateOrderState {
  @Implements<CreateOrderStateBuilder>()
  const factory CreateOrderState.loaded(Order order) = Loaded;

  @Implements<CreateOrderStateBuilder>()
  const factory CreateOrderState.loadedEmpty() = LoadedEmpty;

  @Implements<CreateOrderStateBuilder>()
  const factory CreateOrderState.loading() = Loading;

  @Implements<CreateOrderStateListener>()
  const factory CreateOrderState.showOrderSuccesfullyAddedDialog(int orderNumber) = ShowOrderSuccesfullyAddedDialog;

  @Implements<CreateOrderStateListener>()
  const factory CreateOrderState.error(Object error) = Error;
  const factory CreateOrderState.idle() = Idle;
}

abstract class CreateOrderStateBuilder {}

abstract class CreateOrderStateListener {}
