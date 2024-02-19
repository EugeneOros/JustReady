import 'package:flutter/material.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/create_order/utils/create_order_form_control_names.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';
import 'package:just_ready/presentation/widgets/jr_bottom_box.dart';
import 'package:just_ready/presentation/widgets/jr_divider.dart';
import 'package:just_ready/presentation/widgets/jr_price.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/presentation/widgets/text_fields/jr_text_field.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CreateOrderBottomBox extends StatelessWidget {
  final Order order;
  final Function(String) onAditionalInstructionChanged;
  final Function() sendOrder;
  final Function() onAddMoreMeals;

  const CreateOrderBottomBox({
    super.key,
    required this.order,
    required this.onAditionalInstructionChanged,
    required this.sendOrder,
    required this.onAddMoreMeals,
  });

  @override
  Widget build(BuildContext context) {
    FormGroup form = FormGroup({
      CreateOrderFormControlName.additionalInstructions: FormControl<String>(),
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
            title: Strings.of(context).addMealsToOrder,
            onTap: onAddMoreMeals,
          ),
          JrButton(
            constraints: const BoxConstraints(
              maxWidth: Dimens.buttonMaxWidth,
            ),
            width: double.infinity,
            title: Strings.of(context).orderNow,
            onTap: sendOrder,
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
              onChanged: (formControl) => onAditionalInstructionChanged(formControl.value),
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
                  Strings.of(context).orderSum(order.orderMeals.length),
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
    );
  }
}
