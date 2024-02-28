import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/presentation/widgets/jr_price.dart';
import 'package:just_ready/styles/dimens.dart';

class PriceBadge extends StatelessWidget {
  final double price;
  final double angle;
  const PriceBadge({
    super.key,
    required this.price,
    this.angle = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: JrContainer(
        backgroundColor: context.colors.secondary,
        borderRadius: Dimens.xm,
        width: Dimens.xxxc,
        height: Dimens.c,
        margin: const EdgeInsets.all(Dimens.s),
        padding: const EdgeInsets.all(Dimens.zero),
        child: JrPrice(
          price: price,
          colorType: JrPriceColorType.bright,
        ),
      ),
    );
  }
}
