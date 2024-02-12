import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';

class JrText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final Color? color;
  final Color? decorationColor;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final int maxLines;

  const JrText(
    this.data, {
    super.key,
    this.style,
    this.color,
    this.decorationColor,
    this.textAlign = TextAlign.left,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 3,
  });

  @override
  Widget build(BuildContext context) => Text(
        data,
        style: (style ?? context.typography.body1).copyWith(
          color: color ?? context.colors.dark,
          decorationColor: decorationColor,
        ),
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
      );
}
