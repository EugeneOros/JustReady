import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';

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
    return JrContainer(
      backgroundColor: isSelected ? context.colors.primary : context.colors.bright,
      borderRadius: Dimens.xm,
      width: Dimens.xxxc,
      height: Dimens.c,
      margin: const EdgeInsets.all(Dimens.s),
      // padding: const EdgeInsets.symmetric(horizontal: Dimens.s, vertical: Dimens.xxs),
      child: Container(
        alignment: Alignment.center,
        child: JrText(
          number.toString(),
          color: context.colors.dark,
          style: context.typography.body1,
        ),
      ),
    );
  }
}
