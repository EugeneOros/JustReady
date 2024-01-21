import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.selectedPage({
    required int index,
    required String path,
  }) = SelectedPageState;

  const factory HomeState.idle() = IdleState;
}
