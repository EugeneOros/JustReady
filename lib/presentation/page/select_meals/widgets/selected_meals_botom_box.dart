import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/select_meals/utils/select_form_control_names.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';
import 'package:just_ready/presentation/widgets/jr_bottom_box.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:reactive_forms/reactive_forms.dart';

const initMealCountValue = 1;

class SelectedMealBottomBox extends StatelessWidget {
  const SelectedMealBottomBox({
    super.key,
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
            type: ButtonType.secondary,
            title: Strings.of(context).scelectedMealReturnToOrder,
            onTap: context.pop,
          ),
        ],
      ),
    );
  }
}
