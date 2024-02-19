import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/router/pop_navigation_result.dart';
import 'package:just_ready/styles/app_typography.dart';
import 'package:just_ready/styles/colors.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/utils/ignore_else_state.dart';
import 'package:just_ready/utils/show_base_snackbar.dart';

extension BuildContextExtensions on BuildContext {
  CustomColors get colors => Theme.of(this).extension<CustomColors>() ?? CustomColors.lightTheme;

  CustomTypography get typography => Theme.of(this).extension<CustomTypography>() ?? CustomTypography.standard;

  Future<T?> showAppDialog<T>({required Widget body}) => showDialog(
        context: this,
        builder: (_) => body,
      );

  void showSteelSnackBar({String? message}) => showBaseSnackBar(
        this,
        child: Text(message ?? Strings.of(this).somthingWentWrong),
      );

  Future<T?> showBottomSheet<T>({required Widget body}) => showModalBottomSheet(
        isScrollControlled: true,
        context: this,
        backgroundColor: colors.background,
        useRootNavigator: true,
        builder: (_) => SizedBox(
          height: MediaQuery.of(this).size.height - Dimens.xl,
          child: body,
        ),
        barrierColor: colors.dark.withOpacity(0.5),

        // backgroundColor: colors.bright,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimens.m),
            topRight: Radius.circular(Dimens.m),
          ),
        ),
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
