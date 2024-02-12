import 'package:flutter/material.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/select_meals/utils/select_form_control_names.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';
import 'package:just_ready/presentation/widgets/jr_bottom_box.dart';
import 'package:just_ready/presentation/widgets/jr_number_edit_field.dart';
import 'package:just_ready/presentation/widgets/jr_price.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:reactive_forms/reactive_forms.dart';

const initMealCountValue = 1;

class SelectedMealBottomBox extends StatelessWidget {
  final Meal meal;
  final Function(int) addMealToOrder;
  final Function(int?) changeSelectedIndex;

  const SelectedMealBottomBox({
    super.key,
    required this.meal,
    required this.addMealToOrder,
    required this.changeSelectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    FormGroup form = FormGroup({
      SelectMealFormControlName.count: FormControl<int>(
        value: initMealCountValue,
        validators: [
          Validators.number,
          Validators.required,
          Validators.min(1),
          Validators.max(100),
        ],
      ),
    });

    return ReactiveForm(
      formGroup: form,
      child: JrBottomBox(
        buttons: [
          JrButton(
            constraints: const BoxConstraints(
              maxWidth: Dimens.buttonMaxWidth,
            ),
            width: double.infinity,
            title: Strings.of(context).addToOrder,
            onTap: () {
              addMealToOrder(form.control(SelectMealFormControlName.count).value);
              changeSelectedIndex(null);
            },
          ),
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Dimens.s),
            Row(
              children: [
                Expanded(
                  child: JrText(
                    meal.name,
                    maxLines: 3,
                    color: context.colors.dark,
                  ),
                ),
                JrPrice(
                  price: meal.price,
                  colorType: JrPriceColorType.primary,
                  // color: context.colors.dark,
                ),
              ],
            ),
            const SizedBox(height: Dimens.s),
            JrNumberEditField(
              form: form,
              formControlName: SelectMealFormControlName.count,
              initialValue: initMealCountValue,
            ),
            const SizedBox(height: Dimens.s),
          ],
        ),
      ),
    );
  }
}
