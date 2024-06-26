import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/extensions/build_context_extension.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/meals/widgets/meal_card/body/meal_body.dart';
import 'package:just_ready/presentation/page/meals/widgets/meal_card/utils/meal_form_control_names.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_icon_button.dart';
import 'package:just_ready/presentation/widgets/jr_animated_switcher.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/presentation/widgets/jr_number_circle.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';
import 'package:just_ready/utils/is_meal_number_not_taken_validator.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MealCard extends HookWidget {
  final List<Meal> meals;
  final Meal meal;
  final Function(Meal, int) onEdit;
  final Function? onCancel;
  final Function(int)? onDelete;
  final Function(bool) setIsEditing;
  final bool isEditing;
  final String? actionIcon;
  const MealCard({
    super.key,
    required this.meals,
    required this.meal,
    required this.onEdit,
    required this.isEditing,
    required this.setIsEditing,
    this.onDelete,
    this.onCancel,
    this.actionIcon,
  });

  @override
  Widget build(BuildContext context) {
    FormGroup form = FormGroup({
      MealFormControlName.name: FormControl<String>(
        value: meal.name,
        validators: [
          Validators.required,
        ],
      ),
      MealFormControlName.price: FormControl<double>(
        value: meal.price,
        validators: [
          Validators.required,
        ],
      ),
      MealFormControlName.doublePrice: FormControl<double>(
        value: meal.doublePrice,
      ),
      MealFormControlName.number: FormControl<int>(
        value: meal.number,
        validators: [
          Validators.number,
          Validators.min(1),
          Validators.max(100),
          IsMealNumberNotTakenValidator(meal.number, meals),
        ],
      ),
    });

    return ReactiveForm(
      formGroup: form,
      child: Align(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.ms),
          constraints: const BoxConstraints(
            maxWidth: Dimens.lWidth,
          ),
          child: Stack(
            children: [
              JrContainer(
                showShadow: isEditing,
                isAnimated: true,
                borderRadius: Dimens.ms,
                height: isEditing ? Dimens.expandedMealCardHeight : Dimens.xxsHeight,
                margin: const EdgeInsets.fromLTRB(Dimens.m, Dimens.xm, Dimens.xm, Dimens.xm),
                child: MealCardBody(
                  isEditing: isEditing,
                  meal: meal,
                  form: form,
                  actionIcon: actionIcon,
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: JrAnimatedSwitcher(
                  child: isEditing
                      ? const SizedBox.shrink()
                      : Center(
                          child: JrNumberCircle(
                            size: NumberCircleSize.m,
                            number: meal.number,
                          ),
                        ),
                ),
              ),
              if (!isEditing)
                Positioned(
                  right: 0,
                  top: 0,
                  child: JrIconButton(
                    size: Dimens.xl,
                    icon: IconsSvg.edit24,
                    color: context.colors.primary,
                    type: IconButtonType.tertiary,
                    onTap: () => setIsEditing(true),
                    // onPressed: () => isEditing.value = !isEditing.value,
                  ),
                ),
              if (isEditing)
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: Dimens.l),
                      Expanded(
                        child: Center(
                          child: JrButton(
                            title: Strings.of(context).cancel,
                            type: ButtonType.tertiary,
                            color: context.colors.secondary,
                            onTap: () async {
                              if (onCancel != null) onCancel!();
                              setIsEditing(false);
                              // isEditing.value = !isEditing.value;
                              form.markAllAsTouched();
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: Dimens.m),
                      Expanded(
                        child: Center(
                          child: JrButton(
                            title: Strings.of(context).save,
                            onTap: () async {
                              if (form.valid) {
                                await onEdit(
                                  Meal(
                                    name: form.controls[MealFormControlName.name]!.value.toString(),
                                    number: form.controls[MealFormControlName.number]!.value as int,
                                    price: form.controls[MealFormControlName.price]!.value as double,
                                    doublePrice: form.controls[MealFormControlName.doublePrice]!.value as double?,
                                  ),
                                  meal.number,
                                );
                                setIsEditing(false);
                              } else {
                                form.markAllAsTouched();
                              }
                            },
                          ),
                        ),
                      ),
                      if (onDelete != null) ...[
                        const SizedBox(width: Dimens.m),
                        Expanded(
                          child: Center(
                            child: JrIconButton(
                              icon: IconsSvg.delete24,
                              type: IconButtonType.tertiary,
                              color: context.colors.red,
                              onTap: () async {
                                await onDelete!(meal.number);
                                setIsEditing(false);
                                // isEditing.value = !isEditing.value;
                                form.markAllAsTouched();
                              },
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(width: Dimens.l),
                    ],
                  ),
                ),
              // Other widgets can be added inside the Stack if needed
            ],
          ),
        ),
      ),
    );
  }
}
