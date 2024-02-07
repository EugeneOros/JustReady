import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/models/order_meal.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/create_order/utils/create_order_form_control_names.dart';
import 'package:just_ready/presentation/page/create_order/widgets/order_meal_card.dart';
import 'package:just_ready/presentation/router/route_name.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';
import 'package:just_ready/presentation/widgets/jr_bottom_box.dart';
import 'package:just_ready/presentation/widgets/jr_divider.dart';
import 'package:just_ready/presentation/widgets/jr_price.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/presentation/widgets/text_fields/jr_text_field.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CreateOrderLoadedBody extends StatelessWidget {
  final Order order;
  final Function(OrderMeal) onDeleteMeal;
  final Function(OrderMeal, int) onEditMealCount;
  const CreateOrderLoadedBody({
    super.key,
    required this.order,
    required this.onDeleteMeal,
    required this.onEditMealCount,
  });

  @override
  Widget build(BuildContext context) {
    FormGroup form = FormGroup({
      CreateOrderFormControlName.additionalInstructions: FormControl<String>(),
    });

    return ReactiveForm(
      formGroup: form,
      child: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: order.meals.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return OrderMealCard(
                      orderMeal: order.meals[index],
                      onEditCount: (count) => onEditMealCount(order.meals[index], count),
                      onDelete: () => onDeleteMeal(order.meals[index]),
                    );
                  },
                ),
                const SizedBox(height: Dimens.xxxxc + Dimens.xxxxc)
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: JrBottomBox(
              buttons: [
                JrButton(
                  constraints: const BoxConstraints(
                    maxWidth: Dimens.buttonMaxWidth,
                  ),
                  width: double.infinity,
                  type: ButtonType.secondary,
                  title: Strings.of(context).addMealsToOrder,
                  onTap: () => context.goNamed(JustReadyRoute.selectMeals.name),
                ),
                JrButton(
                  constraints: const BoxConstraints(
                    maxWidth: Dimens.buttonMaxWidth,
                  ),
                  width: double.infinity,
                  title: Strings.of(context).orderNow,
                  onTap: () {},
                ),
              ],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Dimens.s),
                  JrText(Strings.of(context).additionalInstructions),
                  const SizedBox(height: Dimens.s),
                  JrTextField(
                    formControlName: CreateOrderFormControlName.additionalInstructions,
                    labelText: Strings.of(context).additionalInstructionsExample,
                    maxLines: 2,
                    minLines: 2,
                  ),
                  const SizedBox(height: Dimens.m),
                  JrDivider(
                    color: context.colors.darkLight,
                    width: Dimens.xxxxs,
                    isVertical: false,
                  ),
                  const SizedBox(height: Dimens.xxs),
                  Row(
                    children: [
                      JrText(
                        Strings.of(context).orderSum(order.meals.length),
                        color: context.colors.dark,
                      ),
                      const Spacer(),
                      JrPrice(
                        price: order.getSumPrice(),
                        colorType: JrPriceColorType.primary,
                        // color: context.colors.dark,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
