import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/page/meals/widgets/meal_card/utils/meal_form_control_names.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_icon_button.dart';
import 'package:just_ready/presentation/widgets/text_fields/jr_number_text_field.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';
import 'package:reactive_forms/reactive_forms.dart';

class NumberEditField extends HookWidget {
  final FormGroup form;

  final int initialValue;

  const NumberEditField({
    super.key,
    required this.form,
    this.initialValue = 1,
  });

  @override
  Widget build(BuildContext context) {
    const min = 1;
    final number = useState(initialValue);
    final controller = useTextEditingController(text: initialValue.toString());

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        JrIconButton(
          size: Dimens.l,
          icon: IconsSvg.minus24,
          onPressed: () {
            if (number.value > min) {
              number.value--;
              form.control(MealFormControlesName.number).value = number.value;
              controller.text = number.value.toString();
              controller.moveCursorToEnd();
            }
          },
        ),
        const SizedBox(width: Dimens.s),
        SizedBox(
          width: Dimens.c,
          height: Dimens.xxl,
          child: JrNumberTextField(
            formControlName: MealFormControlesName.number,
            form: form,
            onTap: (_) => controller.selectAll(),
            controller: controller,
            onChanged: (formControl) {
              final isControllerEmpty = controller.text.isEmpty;
              number.value = formControl.value ?? 0;
              controller.text = number.value.toString();
              isControllerEmpty ? controller.selectAll() : controller.moveCursorToEnd();
            },
          ),
        ),
        const SizedBox(width: Dimens.s),
        JrIconButton(
          size: Dimens.l,
          icon: IconsSvg.plus24,
          onPressed: () {
            number.value++;
            form.control(MealFormControlesName.number).value = number.value;
            controller.text = number.value.toString();
            controller.moveCursorToEnd();
          },
        ),
      ],
    );
  }
}
