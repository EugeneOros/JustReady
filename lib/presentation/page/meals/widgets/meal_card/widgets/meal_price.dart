import 'package:flutter/material.dart';
import 'package:just_ready/extensions/build_context_extension.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';

class MealPrice extends StatelessWidget {
  final double price;
  final String curency;
  const MealPrice({super.key, required this.price, this.curency = 'PLN'});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimens.xxxc,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          JrText(
            price.toInt().toString(),
            color: context.colors.secondary,
            style: context.typography.header2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              JrText(
                formatCents(extractCents(price)),
                style: context.typography.subtitle2,
              ),
              JrText(
                curency,
                style: context.typography.body1,
              )
            ],
          ),
        ],
      ),
    );
  }

  int extractCents(double price) => ((price * 100) % 100).round();

  String formatCents(int cents) {
    int formattedCents = cents.clamp(0, 99);
    String centsString = formattedCents.toString().padLeft(2, '0');
    return centsString;
  }
}
