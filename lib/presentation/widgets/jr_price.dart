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
  l,
}

class JrPrice extends StatelessWidget {
  final double price;
  final String curency;
  final JrPriceColorType colorType;
  final Color? color;
  final JrPriceSize size;
  const JrPrice({
    super.key,
    required this.price,
    this.curency = 'PLN',
    this.colorType = JrPriceColorType.primary,
    this.size = JrPriceSize.l,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        JrText(
          price.toInt().toString(),
          color: getPriceColor(context),
          style: size == JrPriceSize.l ? context.typography.header3 : context.typography.header4,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JrText(
              formatCents(extractCents(price)),
              color: getCentsColor(context),
              style: size == JrPriceSize.l ? context.typography.subtitle2 : context.typography.subtitle2,
            ),
            JrText(
              curency,
              color: getCurencyColor(context),
              style: size == JrPriceSize.l ? context.typography.body3 : context.typography.subtitle2,
            )
          ],
        ),
      ],
    );
  }

  Color getPriceColor(BuildContext context) {
    switch (colorType) {
      case JrPriceColorType.primary:
        return color ?? context.colors.secondary;
      case JrPriceColorType.bright:
        return context.colors.bright;
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

  Color getCurencyColor(BuildContext context) {
    switch (colorType) {
      case JrPriceColorType.primary:
        return size == JrPriceSize.l ? context.colors.dark : context.colors.darkLight;
      case JrPriceColorType.bright:
        return color ?? context.colors.dark;
    }
  }
}
