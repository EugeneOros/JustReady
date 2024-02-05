import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/domain/orders/models/order_meal.dart';
import 'package:just_ready/extensions/build_context_extension.dart';
import 'package:just_ready/presentation/page/create_order/utils/create_order_form_control_names.dart';
import 'package:just_ready/presentation/page/create_order/widgets/meal_price.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/presentation/widgets/jr_divider.dart';
import 'package:just_ready/presentation/widgets/jr_number_edit_field.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:reactive_forms/reactive_forms.dart';

class OrderMealCard extends HookWidget {
  final OrderMeal orderMeal;
  final Function(OrderMeal) onEdit;
  final Function? onCancel;
  final Function(String)? onDelete;
  final String? actionIcon;
  const OrderMealCard({
    super.key,
    required this.orderMeal,
    required this.onEdit,
    this.onDelete,
    this.onCancel,
    this.actionIcon,
  });

  @override
  Widget build(BuildContext context) {
    // final isEditing = useState<bool>(onDelete != null ? false : true);

    FormGroup form = FormGroup({
      CreateOrderFormControlName.count: FormControl<int>(
        value: orderMeal.count,
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
          constraints: const BoxConstraints(
            maxWidth: Dimens.lMaxCardButtonWidth,
          ),
          child: JrContainer(
            showShadow: false,
            isAnimated: true,
            borderRadius: Dimens.ms,
            height: Dimens.xxxxc,
            margin: const EdgeInsets.symmetric(horizontal: Dimens.ms, vertical: Dimens.m),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: Dimens.m),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        JrText(
                          orderMeal.meal.name,
                          overflow: TextOverflow.ellipsis,
                          color: context.colors.dark,
                          maxLines: 2,
                        ),
                        JrNumberEditField(
                          form: form,
                          formControlName: CreateOrderFormControlName.count,
                          initialValue: orderMeal.count,
                        ),
                      ],
                    ),
                  ),
                ),
                const JrDivider(),
                OrderMealPrice(price: orderMeal.meal.price),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
