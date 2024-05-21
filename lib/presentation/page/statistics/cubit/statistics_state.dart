import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/presentation/page/statistics/models/statistic.dart';

part 'statistics_state.freezed.dart';

@freezed
class StatisticsState with _$StatisticsState {
  @Implements<StatisticsStateBuilder>()
  const factory StatisticsState.loaded(Map<Meal, Statistic> orderMealsMap) = Loaded;

  @Implements<StatisticsStateBuilder>()
  const factory StatisticsState.loading() = Loading;

  @Implements<StatisticsStateBuilder>()
  const factory StatisticsState.error(Object error) = Error;

  const factory StatisticsState.idle() = Idle;
}

abstract class StatisticsStateListener {}

abstract class StatisticsStateBuilder {}
