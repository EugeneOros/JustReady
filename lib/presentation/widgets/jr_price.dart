import 'package:flutter/material.dart';
import 'package:just_ready/extensions/build_context_extension.dart';
import 'package:just_ready/presentation/page/select_meals/utils/price.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';

enum JrPriceColorType {
  primary,
  bright,
}

enum JrPriceSize {
  s,
  m,
  l,
}

class JrPrice extends StatelessWidget {
  final double price;
  final String curency;
  final JrPriceColorType colorType;
  final Color? color;
  final Color? currencyColor;
  final JrPriceSize size;
  const JrPrice({
    super.key,
    required this.price,
    this.curency = 'PLN',
    this.colorType = JrPriceColorType.primary,
    this.size = JrPriceSize.l,
    this.color,
    this.currencyColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        JrText(
          price.toInt().toString(),
          color: getPriceColor(context),
          style: getPriceTextStyle(context),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JrText(
              formatCents(extractCents(price)),
              color: getCentsColor(context),
              style: getCentsTextStyle(context),
            ),
            JrText(
              curency,
              color: getCurencyColor(context),
              style: getCurencyTextStyle(context),
            )
          ],
        ),
      ],
    );
  }

  TextStyle getPriceTextStyle(BuildContext context) {
    switch (size) {
      case JrPriceSize.s:
        return context.typography.body1;
      case JrPriceSize.m:
        return context.typography.header4;
      case JrPriceSize.l:
        return context.typography.header3;
    }
  }

  Color getPriceColor(BuildContext context) {
    switch (colorType) {
      case JrPriceColorType.primary:
        return color ?? context.colors.secondary;
      case JrPriceColorType.bright:
        return context.colors.bright;
    }
  }

  TextStyle getCentsTextStyle(BuildContext context) {
    switch (size) {
      case JrPriceSize.s:
        return context.typography.subtitle3;
      case JrPriceSize.m:
        return context.typography.subtitle2;
      case JrPriceSize.l:
        return context.typography.subtitle2;
    }
  }

  Color getCentsColor(BuildContext context) {
    switch (colorType) {
      case JrPriceColorType.primary:
        return color ?? context.colors.dark;
      case JrPriceColorType.bright:
        return context.colors.bright;
    }
  }

  TextStyle getCurencyTextStyle(BuildContext context) {
    switch (size) {
      case JrPriceSize.s:
        return context.typography.subtitle3;
      case JrPriceSize.m:
        return context.typography.subtitle2;
      case JrPriceSize.l:
        return context.typography.body3;
    }
  }

  Color getCurencyColor(BuildContext context) {
    if (currencyColor != null) return currencyColor!;
    switch (colorType) {
      case JrPriceColorType.primary:
        return size == JrPriceSize.l ? context.colors.dark : context.colors.darkLight;
      case JrPriceColorType.bright:
        return color ?? context.colors.dark;
    }
  }
}
