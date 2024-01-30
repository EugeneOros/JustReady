import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_ready/presentation/router/pop_navigation_result.dart';
import 'package:just_ready/styles/app_typography.dart';
import 'package:just_ready/styles/colors.dart';
import 'package:just_ready/utils/ignore_else_state.dart';

extension BuildContextExtensions on BuildContext {
  CustomColors get colors => Theme.of(this).extension<CustomColors>() ?? CustomColors.lightTheme;

  CustomTypography get typography => Theme.of(this).extension<CustomTypography>() ?? CustomTypography.standard;

  Future<T?> showAppDialog<T>({required Widget body}) => showDialog(
        context: this,
        builder: (_) => body,
      );

  Future<T?> showBottomSheet<T>({required Widget body}) => showModalBottomSheet(
        isScrollControlled: true,
        context: this,
        backgroundColor: colors.transparent,
        builder: (_) => body,
      );

  Future<void> showBottomSheetWithResultActions({
    required Widget body,
    VoidCallback onSuccessResult = doNothing,
    VoidCallback onFailedResult = doNothing,
    VoidCallback onElseResult = doNothing,
  }) async {
    final result = await showBottomSheet(body: body);

    if (result == const PopNavigationResult.success()) {
      onSuccessResult();
    } else if (result == const PopNavigationResult.failed()) {
      onFailedResult();
    } else {
      onElseResult();
    }
  }

  void popWithSuccessResult() => pop(const PopNavigationResult.success());
}
