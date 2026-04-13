import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/domain/orders/models/order_meal.dart';
import 'package:just_ready/extensions/build_context_extension.dart';
import 'package:just_ready/presentation/page/create_order/utils/create_order_form_control_names.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_icon_button.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/presentation/widgets/jr_number_edit_field.dart';
import 'package:just_ready/presentation/widgets/jr_price.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';
import 'package:reactive_forms/reactive_forms.dart';

class OrderMealCard extends HookWidget {
  final OrderMeal orderMeal;
  final Function(int) onEditCount;
  final Function() onDelete;
  final String? actionIcon;

  const OrderMealCard({
    super.key,
    required this.orderMeal,
    required this.onEditCount,
    required this.onDelete,
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
          Validators.min(0),
          Validators.max(100),
        ],
      ),
    });
    form.control(CreateOrderFormControlName.count).value = orderMeal.count;

    return ReactiveForm(
      formGroup: form,
      child: Align(
        child: Container(
          padding: const EdgeInsets.fromLTRB(Dimens.xm, Dimens.s, Dimens.xm, Dimens.zero),
          constraints: const BoxConstraints(
            maxWidth: Dimens.lWidth,
          ),
          child: Stack(
            children: [
              JrContainer(
                showShadow: false,
                isAnimated: true,
                borderRadius: Dimens.ms,
                height: orderMeal.selectedAddons.isEmpty ? Dimens.sMaxCardHeight : 130.0,
                margin: const EdgeInsets.all(Dimens.xm),
                padding: const EdgeInsets.symmetric(horizontal: Dimens.xm, vertical: Dimens.s),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: JrText(
                        orderMeal.meal.name,
                        overflow: TextOverflow.ellipsis,
                        color: context.colors.dark,
                        maxLines: 2,
                      ),
                    ),
                    if (orderMeal.selectedAddons.isNotEmpty) ...[
                      const SizedBox(height: Dimens.xs),
                      Wrap(
                        spacing: Dimens.xs,
                        runSpacing: Dimens.xs,
                        children: orderMeal.selectedAddons
                            .map(
                              (addon) => Container(
                                padding: const EdgeInsets.symmetric(horizontal: Dimens.s, vertical: 2),
                                decoration: BoxDecoration(
                                  border: Border.all(color: context.colors.dark.withValues(alpha: 0.4)),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Text(
                                  '+${addon.name}',
                                  style: TextStyle(fontSize: 11, color: context.colors.dark.withValues(alpha: 0.7)),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                    const SizedBox(height: Dimens.s),
                    Row(
                      children: [
                        JrNumberEditField(
                          form: form,
                          formControlName: CreateOrderFormControlName.count,
                          minValue: 0,
                          onChange: (count) {
                            final value = int.tryParse(count);
                            if (value == null) return;
                            if (value == 0) {
                              onDelete();
                            } else {
                              onEditCount(value);
                            }
                          },
                        ),
                        const Spacer(),
                        JrPrice(
                          size: JrPriceSize.m,
                          price: orderMeal.price,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: JrIconButton(
                  icon: IconsSvg.delete24,
                  type: IconButtonType.tertiary,
                  color: context.colors.red,
                  size: Dimens.xxl,
                  onTap: onDelete,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
