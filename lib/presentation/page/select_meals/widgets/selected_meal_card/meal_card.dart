import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/presentation/page/select_meals/utils/select_form_control_names.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/selected_meal_card/meal_card_body.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/selected_meal_card/widgets/card_overlay.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/selected_meal_card/widgets/order_cart_label.dart';
import 'package:just_ready/extensions/build_context_extension.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';

import 'package:just_ready/styles/dimens.dart';
import 'package:reactive_forms/reactive_forms.dart';

const initMealCountValue = 1;

class MealCard extends HookWidget {
  final Meal meal;
  final int index;
  final int orderCount;
  final Function(int) onAddToOrder;
  final Function(Meal) onMealAddedToOrder;

  const MealCard({
    super.key,
    required this.meal,
    required this.index,
    this.orderCount = 0,
    required this.onAddToOrder,
    required this.onMealAddedToOrder,
  });

  @override
  Widget build(BuildContext context) {
    final showMealAddingProgress = useState(false);
    final form = useMemoized(
      () => FormGroup({
        SelectMealFormControlName.count: FormControl<int>(
          value: initMealCountValue,
          validators: [
            Validators.number,
            Validators.required,
            Validators.min(1),
            Validators.max(100),
          ],
        ),
      }),
    );

    return ReactiveForm(
      formGroup: form,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: Dimens.m),
            child: MealCardBody(
              meal: meal,
              index: index,
              orderCount: orderCount,
              initMealCountValue: initMealCountValue,
              form: form,
              showMealAddingProgress: showMealAddingProgress.value,
            ),
          ),
          if (orderCount != 0)
            Positioned(
              right: -Dimens.s,
              top: -Dimens.s,
              child: Container(
                decoration: BoxDecoration(
                  color: context.colors.bright,
                  shape: BoxShape.circle,
                  border: Border.all(color: context.colors.dark, width: Dimens.xxxs),
                ),
                child: OrderCartLable(number: orderCount),
              ),
            ),
          Positioned(
            left: Dimens.xm,
            right: Dimens.xm,
            bottom: 0,
            child: Center(
              child: JrButton(
                title: Strings.of(context).add,
                type: ButtonType.primary,
                color: context.colors.dark,
                textColor: context.colors.bright,
                constraints: const BoxConstraints(maxWidth: Dimens.buttonMaxWidth),
                width: double.infinity,
                state: showMealAddingProgress.value ? ButtonState.disabled : ButtonState.active,
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
          ),
          if (showMealAddingProgress.value)
            Positioned.fill(
              child: CardOverlay(
                onFinishAnimation: () {
                  showMealAddingProgress.value = false;
                },
              ),
            ),
        ],
      ),
    );
  }
}
