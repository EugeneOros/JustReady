import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/page/meals/widgets/meal_card/utils/meal_form_control_names.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';
import 'package:just_ready/presentation/widgets/text_fields/jr_text_field.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MealAddonsSection extends HookWidget {
  final FormArray addonsArray;

  const MealAddonsSection({super.key, required this.addonsArray});

  @override
  Widget build(BuildContext context) {
    useStream(addonsArray.collectionChanges);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dodatki',
          style: context.typography.body1.copyWith(color: context.colors.dark),
        ),
        const SizedBox(height: Dimens.s),
        ...addonsArray.controls.asMap().entries.map((entry) {
          final index = entry.key;
          final group = entry.value as FormGroup;
          return Padding(
            padding: const EdgeInsets.only(bottom: Dimens.s),
            child: ReactiveForm(
              formGroup: group,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: JrTextField(
                      formControlName: MealFormControlName.addonName,
                      labelText: 'Nazwa dodatku',
                      isFloatingLabel: false,
                    ),
                  ),
                  const SizedBox(width: Dimens.s),
                  Expanded(
                    flex: 2,
                    child: JrTextField(
                      formControlName: MealFormControlName.addonPrice,
                      labelText: 'Cena',
                      isFloatingLabel: false,
                      selectAllOnTap: true,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  IconButton(
                    onPressed: () => addonsArray.removeAt(index),
                    icon: const Icon(Icons.remove_circle_outline),
                    color: context.colors.red,
                  ),
                ],
              ),
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.only(top: Dimens.s, bottom: Dimens.m),
          child: JrButton(
            title: 'Dodaj dodatek',
            type: ButtonType.tertiary,
            color: context.colors.dark,
            textColor: context.colors.dark,
            contentPadding: const EdgeInsets.symmetric(vertical: Dimens.xm, horizontal: Dimens.l),
            onTap: () => addonsArray.add(
              FormGroup({
                MealFormControlName.addonName: FormControl<String>(validators: [Validators.required]),
                MealFormControlName.addonPrice: FormControl<double>(value: 0.0, validators: [Validators.required]),
              }),
            ),
          ),
        ),
      ],
    );
  }
}
