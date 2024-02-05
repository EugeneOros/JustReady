import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/select_meals/utils/select_form_control_names.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/price_badge.dart';
import 'package:just_ready/presentation/widgets/jr_title_row.dart';
import 'package:just_ready/presentation/widgets/jr_number_edit_field.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:reactive_forms/reactive_forms.dart';

const initMealCountValue = 1;

class SelctedMealCard extends HookWidget {
  final Function(int) onAddMealToOrder;
  final Meal meal;

  const SelctedMealCard({
    super.key,
    required this.onAddMealToOrder,
    required this.meal,
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
      child: Align(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: Dimens.ms),
          constraints: const BoxConstraints(
            maxWidth: Dimens.lMaxCardButtonWidth,
          ),
          child: Stack(
            children: [
              JrContainer(
                showShadow: true,
                borderRadius: Dimens.ms,
                height: Dimens.selectedMealCardHeight,
                margin: const EdgeInsets.fromLTRB(Dimens.xxl, Dimens.l, Dimens.xxl, Dimens.m),
                // margin: const EdgeInsets.all(Dimens.zero),
                padding: const EdgeInsets.symmetric(horizontal: Dimens.m, vertical: Dimens.l),
                child: JrTitleRow(
                  title: meal.name,
                  style: context.typography.header3,
                  titleAlign: TextAlign.center,
                  expandedTitle: true,
                  child: JrNumberEditField(
                    form: form,
                    formControlName: SelectMealFormControlName.count,
                    initialValue: initMealCountValue,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: PriceBadge(
                  price: meal.price,
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: Dimens.l),
                    Expanded(
                      child: JrButton(
                        title: Strings.of(context).addToOrder,
                        onTap: () async {
                          if (form.valid) {
                            onAddMealToOrder(form.control(SelectMealFormControlName.count).value);
                          } else {
                            form.markAllAsTouched();
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: Dimens.l),
                  ],
                ),
              ),
              // Other widgets can be added inside the Stack if needed
            ],
          ),
        ),
      ),
    );
  }
}
