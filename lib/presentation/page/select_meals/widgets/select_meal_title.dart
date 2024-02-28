import 'package:flutter/widgets.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';

class SelectMealTitle extends StatelessWidget {
  const SelectMealTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(Dimens.m)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0, 0.7, 1.0],
          colors: [
            context.colors.background,
            context.colors.background,
            context.colors.background.withOpacity(0.0),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.m),
        child: Center(
          child: JrText(
            Strings.of(context).addMealsToOrder,
            style: context.typography.header2,
          ),
        ),
      ),
    );
  }
}
