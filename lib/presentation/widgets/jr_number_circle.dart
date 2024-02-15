import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';

enum NumberCircleSize {
  s,
  m,
  l,
}

class JrNumberCircle extends StatelessWidget {
  final int number;
  final NumberCircleSize size;
  final Color? color;
  final Color? numberColor;

  const JrNumberCircle({
    super.key,
    required this.number,
    this.size = NumberCircleSize.m,
    this.numberColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: _getContainerWidth(),
        height: _getContainerWidth(),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? context.colors.bright,
          border: Border.all(color: context.colors.dark, width: Dimens.xxxs),
        ),
        child: Center(
          child: JrText(
            number.toString(),
            color: numberColor ?? context.colors.secondary,
            style: _getTextStype(context),
          ),
        ),
      );

  double _getContainerWidth() {
    switch (size) {
      case NumberCircleSize.s:
        return Dimens.xl;
      case NumberCircleSize.m:
        return Dimens.xxl;
      case NumberCircleSize.l:
        return Dimens.xxxl;
    }
  }

  TextStyle _getTextStype(BuildContext context) {
    switch (size) {
      case NumberCircleSize.s:
        return context.typography.body1;
      case NumberCircleSize.m:
        return context.typography.header3;
      case NumberCircleSize.l:
        return context.typography.header1;
    }
  }
}
