import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/styles/dimens.dart';

class JrText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final int maxLines;
  final bool lineThrough;

  const JrText(
    this.data, {
    super.key,
    this.style,
    this.color,
    this.textAlign = TextAlign.left,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 3,
    this.lineThrough = false,
  });

  @override
  Widget build(BuildContext context) => Text(
        data,
        style: (style ?? context.typography.body1).copyWith(
          color: color ?? context.colors.dark,
          decorationColor: color,
          decoration: lineThrough ? TextDecoration.lineThrough : null,
          decorationThickness: Dimens.xxxs,
        ),
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
      );
}
