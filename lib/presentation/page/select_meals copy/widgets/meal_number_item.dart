import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';

class MealNumberItem extends StatelessWidget {
  final int number;
  final bool isSelected;
  final Function(bool) onSelect;
  const MealNumberItem({
    super.key,
    required this.number,
    this.isSelected = false,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return JrContainer(
      backgroundColor: isSelected ? context.colors.primary : context.colors.bright,
      borderRadius: Dimens.xm,
      // width: Dimens.xxxc,
      width: Dimens.xxxc,
      // height: Dimens.c,
      height: Dimens.xc,
      margin: const EdgeInsets.all(Dimens.s),
      // padding: const EdgeInsets.symmetric(horizontal: Dimens.s, vertical: Dimens.xxs),
      child: InkWell(
        onTap: () => onSelect(!isSelected),
        child: Container(
          alignment: Alignment.center,
          child: JrText(
            number.toString(),
            color: context.colors.dark,
            style: context.typography.body1,
          ),
        ),
      ),
    );
  }
}
