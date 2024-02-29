import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/extensions/build_context_extension.dart';
import 'package:just_ready/presentation/page/select_meals/utils/select_form_control_names.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/selected_meal_card/widgets/order_cart_label.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/presentation/widgets/jr_number_edit_field.dart';
import 'package:just_ready/presentation/widgets/jr_price.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MealCardBody extends HookWidget {
  final Meal meal;
  final int orderCount;
  final int initMealCountValue;
  final FormGroup form;
  final bool showMealAddingProgress;

  const MealCardBody({
    super.key,
    required this.meal,
    this.orderCount = 0,
    required this.initMealCountValue,
    required this.showMealAddingProgress,
    required this.form,
  });

  @override
  Widget build(BuildContext context) => JrContainer(
        margin: const EdgeInsets.all(Dimens.xm),
        width: double.infinity,
        height: Dimens.sMaxCardHeight,
        borderColor: showMealAddingProgress ? context.colors.primary : context.colors.dark,
        padding: const EdgeInsets.fromLTRB(Dimens.xm, Dimens.s, Dimens.xm, Dimens.s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: JrText(
                meal.name,
                overflow: TextOverflow.ellipsis,
                color: context.colors.dark,
                maxLines: 2,
              ),
            ),
            const SizedBox(height: Dimens.s),
            Row(
              children: [
                JrNumberEditField(
                  form: form,
                  formControlName: SelectMealFormControlName.count,
                  // initialValue: initMealCountValue,
                ),
                if (orderCount != 0)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimens.s),
                    child: OrderCartLable(number: orderCount),
                  ),
                const Spacer(),
                JrPrice(
                  size: JrPriceSize.s,
                  price: meal.price,
                ),
              ],
            ),
          ],
        ),
      );
}
