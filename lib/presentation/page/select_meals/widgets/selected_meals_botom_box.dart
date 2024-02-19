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
          // if (meal != null)
          //   JrButton(
          //     constraints: const BoxConstraints(
          //       maxWidth: Dimens.buttonMaxWidth,
          //     ),
          //     width: double.infinity,
          //     title: Strings.of(context).addToOrder,
          //     onTap: () {
          //       addMealToOrder(form.control(SelectMealFormControlName.count).value);
          //       changeSelectedIndex(null);
          //     },
          //   ),
          JrButton(
            constraints: const BoxConstraints(
              maxWidth: Dimens.buttonMaxWidth,
            ),
            width: double.infinity,
            type: ButtonType.secondary,
            title: Strings.of(context).scelectedMealReturnToOrder,
            onTap: context.pop,
            // prefixIcon: IconsSvg.chevronLeft24,
          ),
        ],
        // child: meal != null
        //     ? Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           const SizedBox(height: Dimens.s),
        //           Row(
        //             children: [
        //               Expanded(
        //                 child: JrText(
        //                   meal!.name,
        //                   maxLines: 3,
        //                   color: context.colors.dark,
        //                 ),
        //               ),
        //               JrPrice(
        //                 price: meal!.price,
        //                 colorType: JrPriceColorType.primary,
        //                 // color: context.colors.dark,
        //               ),
        //             ],
        //           ),
        //           const SizedBox(height: Dimens.s),
        //           JrNumberEditField(
        //             form: form,
        //             formControlName: SelectMealFormControlName.count,
        //             initialValue: initMealCountValue,
        //           ),
        //           const SizedBox(height: Dimens.s),
        //         ],
        //       )
        //     : null,
      ),
    );
  }
}
