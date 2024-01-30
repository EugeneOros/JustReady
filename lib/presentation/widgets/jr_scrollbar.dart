import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/styles/dimens.dart';

class JrScrollBar extends StatelessWidget {
  final Widget child;

  const JrScrollBar({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => RawScrollbar(
        controller: null,
        thumbVisibility: true,
        thumbColor: context.colors.primary,
        trackVisibility: true,
        trackColor: context.colors.dark,
        radius: const Radius.circular(Dimens.xxs),
        trackRadius: const Radius.circular(Dimens.xxs),
        thickness: Dimens.xxs,
        minThumbLength: Dimens.xxc,
        trackBorderColor: context.colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: Dimens.xs),
        child: Padding(
          padding: const EdgeInsets.only(right: Dimens.m),
          child: child,
        ),
      );
}
