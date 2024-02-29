import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';
import 'package:just_ready/presentation/widgets/jr_svg_picture.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';

class CreateOrderLoadedEmptyBody extends StatelessWidget {
  final Function() onAddMeals;
  const CreateOrderLoadedEmptyBody({
    super.key,
    required this.onAddMeals,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            JrSvgPicture(IconsSvg.emptyMeal104),
            const SizedBox(height: Dimens.s),
            JrText(
              Strings.of(context).nothingHire,
              style: context.typography.header3,
            ),
            const SizedBox(height: Dimens.s),
            JrText(
              Strings.of(context).timeToAddSomethingTasty,
            ),
            const SizedBox(height: Dimens.l),
            JrButton(
              onTap: onAddMeals, //context.goNamed(JustReadyRoute.selectMeals.name),
              title: Strings.of(context).addMealsToOrder,
            ),
          ],
        ),
      );
}
