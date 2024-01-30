import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_icon_button.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';

class MealHeaderRow extends StatelessWidget {
  final Function() onAddMeal;
  const MealHeaderRow({
    super.key,
    required this.onAddMeal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: Dimens.xl,
        top: Dimens.xl,
        left: Dimens.xxl,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          JrText(
            Strings.of(context).meals,
            color: context.colors.primary,
            style: context.typography.header1,
          ),
          const Spacer(),
          JrIconButton(
            type: IconButtonType.primary,
            icon: IconsSvg.plus24,
            onPressed: onAddMeal,
          )
        ],
      ),
    );
  }
}
