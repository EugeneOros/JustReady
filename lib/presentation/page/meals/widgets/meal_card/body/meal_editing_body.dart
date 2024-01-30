import 'package:flutter/material.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/meals/widgets/meal_card/utils/meal_form_control_names.dart';
import 'package:just_ready/presentation/page/meals/widgets/meal_card/widgets/editing_body_row.dart';
import 'package:just_ready/presentation/page/meals/widgets/meal_card/widgets/number_edit_field.dart';
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.m),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          JrSvgPicture(
            icon ?? IconsSvg.editMeal24,
            height: Dimens.xxxc,
          ),
          const SizedBox(height: Dimens.m),
          EditingBodyRow(
            title: Strings.of(context).name,
            child: JrTextField(
              form: form,
              isFloatingLabel: false,
              formControlName: MealFormControlesName.name,
              labelText: Strings.of(context).enterMealName,
            ),
          ),
          const SizedBox(height: Dimens.m),
          EditingBodyRow(
            title: Strings.of(context).mealNumber,
            child: NumberEditField(
              form: form,
              initialValue: meal.mealNumber,
            ),
          ),
          const SizedBox(height: Dimens.m),
          EditingBodyRow(
            title: Strings.of(context).price,
            child: JrTextField(
              form: form,
              isFloatingLabel: false,
              formControlName: MealFormControlesName.price,
              labelText: Strings.of(context).enterPriceName,
            ),
          ),
        ],
      ),
    );
  }
}
