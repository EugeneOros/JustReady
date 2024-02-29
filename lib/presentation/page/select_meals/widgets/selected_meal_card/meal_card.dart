import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/presentation/page/select_meals/utils/select_form_control_names.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/selected_meal_card/meal_card_body.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/selected_meal_card/widgets/card_overlay.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_icon_button.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';
import 'package:reactive_forms/reactive_forms.dart';

const initMealCountValue = 1;

class MealCard extends HookWidget {
  final Meal meal;
  final int orderCount;
  final Function(int) onAddToOrder;
  final Function(Meal) onMealAddedToOrder;

  const MealCard({
    super.key,
    required this.meal,
    this.orderCount = 0,
    required this.onAddToOrder,
    required this.onMealAddedToOrder,
  });

  @override
  Widget build(BuildContext context) {
    final showMealAddingProgress = useState(false);
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
          padding: const EdgeInsets.fromLTRB(Dimens.xm, Dimens.s, Dimens.xm, Dimens.s),
          constraints: const BoxConstraints(
            maxWidth: Dimens.lWidth,
          ),
          child: Stack(
            children: [
              MealCardBody(
                meal: meal,
                orderCount: orderCount,
                initMealCountValue: initMealCountValue,
                form: form,
                showMealAddingProgress: showMealAddingProgress.value,
              ),
              if (showMealAddingProgress.value)
                CardOverlay(
                  onFinishAnimation: () {
                    showMealAddingProgress.value = false;
                  }, //onMealAddedToOrder(meal),
                ),
              Positioned(
                right: 0,
                top: 0,
                child: JrIconButton(
                  icon: IconsSvg.plus24,
                  type: IconButtonType.primary,
                  size: Dimens.xl,
                  state: showMealAddingProgress.value ? IconButtonState.disabled : IconButtonState.active,
                  onTap: () async {
                    if (form.valid) {
                      showMealAddingProgress.value = true;
                      onAddToOrder(form.control(SelectMealFormControlName.count).value);
                    } else {
                      form.markAllAsTouched();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Positioned(
              //   right: 0,
              //   left: 0,
              //   bottom: 0,
              //   child: Align(
              //     child: JrButton(
              //       title: Strings.of(context).addToOrder,
              //       type: ButtonType.primary,
              //       state: showMealAddingProgress ? ButtonState.disabled : ButtonState.active,
              //       onTap: () async {
              //         if (form.valid) {
              //           onAddToOrder(form.control(SelectMealFormControlName.count).value);
              //         } else {
              //           form.markAllAsTouched();
              //         }
              //       },
              //     ),
              //   ),
              // ),