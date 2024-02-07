import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/styles/dimens.dart';

class JrDivider extends StatelessWidget {
  final bool isVertical;
  final double width;
  final Color? color;
  const JrDivider({
    super.key,
    this.isVertical = true,
    this.width = Dimens.xxxs,
    this.color,
  });

  @override
  Widget build(BuildContext context) => Container(
        color: color ?? context.colors.dark,
        width: isVertical ? width : double.infinity,
        height: isVertical ? double.infinity : width,
      );
}
