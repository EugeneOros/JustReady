import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_ready/domain/orders/models/order.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.loaded(List<Order> orders) = Loaded;
  const factory DashboardState.announceReady(List<Order> readyOrders) = AnnounceReady;
  const factory DashboardState.loading() = Loading;
  const factory DashboardState.error(Object error) = Error;
  const factory DashboardState.initial() = Initial;
}
