import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/page/select_meals/utils/price.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';

class OrderMealPrice extends StatelessWidget {
  final double price;
  final String curency;
  const OrderMealPrice({
    super.key,
    required this.price,
    this.curency = 'PLN',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        JrText(
          price.toInt().toString(),
          color: context.colors.secondary,
          style: context.typography.header3,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JrText(
              formatCents(extractCents(price)),
              color: context.colors.secondary,
              style: context.typography.subtitle2,
            ),
            JrText(
              curency,
              style: context.typography.body3,
            )
          ],
        ),
      ],
    );
  }
}
