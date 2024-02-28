import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';

class OrderNumberItem extends StatelessWidget {
  final int number;
  final bool isSelected;
  const OrderNumberItem({
    super.key,
    required this.number,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    const size = Dimens.xxc;
    return Container(
      padding: const EdgeInsets.all(Dimens.s),
      child: Hero(
        tag: 'hero-dashboard-number:$number',
        child: Stack(
          children: [
            Positioned(
              child: SizedBox(
                height: size,
                width: size,
                child: Image.asset(
                  Illustrations.plate,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: size,
                width: size,
                padding: const EdgeInsets.only(bottom: Dimens.xs, right: Dimens.xs),
                alignment: Alignment.center,
                child: JrText(
                  number.toString(),
                  color: context.colors.dark,
                  style: context.typography.header3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
