import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/page/select_meals/utils/price.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';

class PriceBadge extends StatelessWidget {
  final double price;
  final String curency;
  const PriceBadge({
    super.key,
    required this.price,
    this.curency = 'PLN',
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.6,
      child: JrContainer(
        backgroundColor: context.colors.secondary,
        borderRadius: Dimens.xm,
        width: Dimens.xxxc,
        height: Dimens.c,
        margin: const EdgeInsets.all(Dimens.s),
        padding: const EdgeInsets.all(Dimens.zero),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JrText(
              price.toInt().toString(),
              color: context.colors.bright,
              style: context.typography.header2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                JrText(
                  formatCents(extractCents(price)),
                  color: context.colors.bright,
                  style: context.typography.subtitle2,
                ),
                JrText(
                  curency,
                  style: context.typography.body3,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
