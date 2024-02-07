import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/router/route_name.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';
import 'package:just_ready/presentation/widgets/jr_svg_picture.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';

class CreateOrderLoadedEmptyBody extends StatelessWidget {
  const CreateOrderLoadedEmptyBody({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            JrSvgPicture(
              IconsSvg.emptyMeal24,
              height: Dimens.xxxc,
            ),
            const SizedBox(height: Dimens.s),
            JrText(
              Strings.of(context).nothingHire,
              style: context.typography.header2,
            ),
            const SizedBox(height: Dimens.s),
            JrText(
              Strings.of(context).timeToAddSomethingTasty,
            ),
            const SizedBox(height: Dimens.l),
            JrButton(
              onTap: () => context.goNamed(JustReadyRoute.selectMeals.name),
              title: Strings.of(context).addMealsToOrder,
            ),
          ],
        ),
      );
}
