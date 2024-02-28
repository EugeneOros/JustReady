import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_ready/domain/orders/models/order.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {

  @Implements<DashboardStateBuilder>()
  const factory DashboardState.loaded(List<Order> orders) = Loaded;

  @Implements<DashboardStateListener>()
  const factory DashboardState.announceReady(Order readyOrder) = AnnounceReady;

  @Implements<DashboardStateBuilder>()
  const factory DashboardState.loading() = Loading;

  @Implements<DashboardStateBuilder>()
  const factory DashboardState.error(Object error) = Error;

  const factory DashboardState.idle() = Idle;
}


abstract class DashboardStateListener {}

abstract class  DashboardStateBuilder {}
