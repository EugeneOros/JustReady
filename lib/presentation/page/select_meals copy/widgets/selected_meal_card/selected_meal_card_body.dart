import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/extensions/build_context_extension.dart';
import 'package:just_ready/presentation/page/select_meals/utils/select_form_control_names.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/presentation/widgets/jr_number_edit_field.dart';
import 'package:just_ready/presentation/widgets/jr_price.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SelectedMealCardBody extends HookWidget {
  final Meal meal;
  final int initMealCountValue;
  final FormGroup form;
  final bool showMealAddingProgress;

  const SelectedMealCardBody({
    super.key,
    required this.meal,
    required this.initMealCountValue,
    required this.showMealAddingProgress,
    required this.form,
  });

  @override
  Widget build(BuildContext context) {
    return JrContainer(
      margin: const EdgeInsets.all(Dimens.xm),
      width: double.infinity,
      height: Dimens.mMaxCardHeight,
      borderColor: showMealAddingProgress ? context.colors.primary : context.colors.dark,
      padding: const EdgeInsets.fromLTRB(Dimens.m, Dimens.xm, Dimens.m, Dimens.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: JrText(
                    meal.name,
                    overflow: TextOverflow.ellipsis,
                    color: context.colors.dark,
                    maxLines: 2,
                  ),
                ),
              ),
              JrPrice(
                size: JrPriceSize.m,
                price: meal.price,
              ),
            ],
          ),
          const SizedBox(height: Dimens.s),
          Row(
            children: [
              JrNumberEditField(
                form: form,
                formControlName: SelectMealFormControlName.count,
                // initialValue: initMealCountValue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// //Todo delete if not needed
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:just_ready/domain/meals/models/meal.dart';
// import 'package:just_ready/extensions/extension_mixin.dart';
// import 'package:just_ready/generated/l10n.dart';
// import 'package:just_ready/presentation/page/select_meals/utils/select_form_control_names.dart';
// import 'package:just_ready/presentation/page/select_meals/widgets/price_badge.dart';
// import 'package:just_ready/presentation/widgets/jr_text.dart';
// import 'package:just_ready/presentation/widgets/jr_number_edit_field.dart';
// import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';
// import 'package:just_ready/presentation/widgets/jr_container.dart';
// import 'package:just_ready/styles/dimens.dart';
// import 'package:reactive_forms/reactive_forms.dart';

// const initMealCountValue = 1;

// class SelctedMealCard extends HookWidget {
//   final Function(int) onAddMealToOrder;
//   final Meal meal;

//   const SelctedMealCard({
//     super.key,
//     required this.onAddMealToOrder,
//     required this.meal,
//   });

//   @override
//   Widget build(BuildContext context) {
//     FormGroup form = FormGroup({
//       SelectMealFormControlName.count: FormControl<int>(
//         value: initMealCountValue,
//         validators: [
//           Validators.number,
//           Validators.required,
//           Validators.min(1),
//           Validators.max(100),
//         ],
//       ),
//     });

//     return ReactiveForm(
//       formGroup: form,
//       child: Align(
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: Dimens.ms),
//           constraints: const BoxConstraints(
//             maxWidth: Dimens.lWidth,
//           ),
//           child: Stack(
//             children: [
//               JrContainer(
//                 showShadow: true,
//                 borderRadius: Dimens.ms,
//                 height: Dimens.selectedMealCardHeight,
//                 margin: const EdgeInsets.fromLTRB(Dimens.xxl, Dimens.l, Dimens.xxl, Dimens.m),
//                 // margin: const EdgeInsets.all(Dimens.zero),
//                 padding: const EdgeInsets.symmetric(horizontal: Dimens.m, vertical: Dimens.l),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     JrText(
//                       meal.name,
//                       style: context.typography.body1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: Dimens.xm),
//                     JrNumberEditField(
//                       form: form,
//                       formControlName: SelectMealFormControlName.count,
//                       initialValue: initMealCountValue,
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 right: 0,
//                 top: 0,
//                 child: PriceBadge(
//                   angle: 0.6,
//                   price: meal.price,
//                 ),
//               ),
//               Positioned(
//                 right: 0,
//                 left: 0,
//                 bottom: 0,
//                 child: Center(
//                   child: JrButton(
//                     title: Strings.of(context).addToOrder,
//                     onTap: () async {
//                       if (form.valid) {
//                         onAddMealToOrder(form.control(SelectMealFormControlName.count).value);
//                       } else {
//                         form.markAllAsTouched();
//                       }
//                     },
//                   ),
//                 ),
//               ),
//               // Other widgets can be added inside the Stack if needed
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
