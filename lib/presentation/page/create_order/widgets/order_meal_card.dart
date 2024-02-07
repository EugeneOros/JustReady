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
  final Function? onCancel;
  final Function() onDelete;
  final String? actionIcon;

  const OrderMealCard({
    super.key,
    required this.orderMeal,
    required this.onEditCount,
    required this.onDelete,
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
          padding: const EdgeInsets.fromLTRB(Dimens.xm, Dimens.s, Dimens.xm, Dimens.zero),
          constraints: const BoxConstraints(
            maxWidth: Dimens.lMaxCardButtonWidth,
          ),
          child: Stack(
            children: [
              JrContainer(
                showShadow: false,
                isAnimated: true,
                borderRadius: Dimens.ms,
                height: Dimens.mMaxCardHeight,
                margin: const EdgeInsets.all(Dimens.xm),
                padding: const EdgeInsets.symmetric(horizontal: Dimens.xm, vertical: Dimens.s),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: JrText(
                          orderMeal.meal.name,
                          overflow: TextOverflow.ellipsis,
                          color: context.colors.dark,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: Dimens.s),
                    Row(
                      children: [
                        JrPrice(
                          size: JrPriceSize.s,
                          price: orderMeal.meal.price,
                        ),
                        const Spacer(),
                        JrNumberEditField(
                          form: form,
                          formControlName: CreateOrderFormControlName.count,
                          initialValue: orderMeal.count,
                          onChange: (count) {
                            if (int.tryParse(count) == null) return;
                            onEditCount(int.parse(count));
                          },
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
                  color: context.colors.error,
                  size: Dimens.xl,
                  onPressed: onDelete,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
