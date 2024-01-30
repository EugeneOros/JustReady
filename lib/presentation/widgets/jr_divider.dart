import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/styles/dimens.dart';

class JrDivider extends StatelessWidget {
  final bool isVertical;
  const JrDivider({
    super.key,
    this.isVertical = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.dark,
      width: isVertical ? Dimens.xxxs : double.infinity,
      height: isVertical ? double.infinity : Dimens.xxxs,
    );
  }
}
