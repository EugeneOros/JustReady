import 'package:flutter/material.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/meals/widgets/meal_card/utils/meal_form_control_names.dart';
import 'package:just_ready/presentation/widgets/jr_title_row.dart';
import 'package:just_ready/presentation/widgets/jr_number_edit_field.dart';
import 'package:just_ready/presentation/widgets/jr_svg_picture.dart';
import 'package:just_ready/presentation/widgets/text_fields/jr_text_field.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MealEditingBody extends StatelessWidget {
  final FormGroup form;
  final Meal meal;
  final String? icon;

  const MealEditingBody({
    super.key,
    required this.form,
    required this.meal,
    this.icon,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(Dimens.m),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            JrSvgPicture(icon ?? IconsSvg.editMeal104),
            const SizedBox(height: Dimens.m),
            JrTitleRow(
              title: Strings.of(context).name,
              child: JrTextField(
                form: form,
                isFloatingLabel: false,
                formControlName: MealFormControlName.name,
                labelText: Strings.of(context).enterMealName,
              ),
            ),
            const SizedBox(height: Dimens.m),
            JrTitleRow(
              title: Strings.of(context).mealNumber,
              expandedTitle: true,
              child: JrNumberEditField(
                form: form,
                formControlName: MealFormControlName.number,
                // initialValue: meal.number,
              ),
            ),
            const SizedBox(height: Dimens.m),
            JrTitleRow(
              title: Strings.of(context).price,
              child: JrTextField(
                form: form,
                isFloatingLabel: false,
                selectAllOnTap: true,
                formControlName: MealFormControlName.price,
                labelText: Strings.of(context).enterPriceName,
              ),
            ),
            const SizedBox(height: Dimens.m),
            JrTitleRow(
              title: Strings.of(context).priceForTwo,
              child: JrTextField(
                form: form,
                isFloatingLabel: false,
                selectAllOnTap: true,
                formControlName: MealFormControlName.doublePrice,
                labelText: Strings.of(context).enterPriceName,
              ),
            ),
          ],
        ),
      );
}
