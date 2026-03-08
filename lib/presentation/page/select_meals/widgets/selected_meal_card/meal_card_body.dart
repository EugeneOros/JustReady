import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/extensions/build_context_extension.dart';
import 'package:just_ready/presentation/page/select_meals/utils/select_form_control_names.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/presentation/widgets/jr_number_edit_field.dart';
import 'package:just_ready/presentation/widgets/jr_price.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:reactive_forms/reactive_forms.dart';

const _titleColors = [
  Color(0xFFFFADAD), // coral red
  Color(0xFFA0D2FF), // sky blue
  Color(0xFFFFF1A8), // lemon yellow
  Color(0xFFD4A5FF), // lavender
  Color(0xFFB5EAD7), // mint green
  Color(0xFFFFC3A0), // peach
  Color(0xFFC3D5FF), // periwinkle
  Color(0xFFFFD6A5), // apricot
  Color(0xFF9ED8DB), // teal
  Color(0xFFFFBFD6), // rose
  Color(0xFFB8D4A3), // olive green
  Color(0xFFE0BBE4), // mauve
  Color(0xFFFFE0A3), // golden
  Color(0xFF9FB8D4), // steel blue
  Color(0xFFF4B9C2), // blush pink
  Color(0xFFA3D9C8), // jade
  Color(0xFFDEB887), // burlywood
  Color(0xFFB0C4DE), // light steel
  Color(0xFFFFCBA4), // melon
  Color(0xFFC5A3D9), // orchid
  Color(0xFFD4E09B), // lime
  Color(0xFFD4A5A5), // dusty rose
  Color(0xFF87CEEB), // sky
  Color(0xFFEBC8A0), // sand
  Color(0xFFAEC6CF), // pastel teal
  Color(0xFFFFB347), // orange
  Color(0xFFB39EB5), // pastel purple
  Color(0xFFCBE86B), // pear green
  Color(0xFFDEA5A4), // salmon pink
  Color(0xFF8EC8E3), // cornflower
  Color(0xFFFFF0C1), // butter
];

class MealCardBody extends HookWidget {
  final Meal meal;
  final int index;
  final int orderCount;
  final int initMealCountValue;
  final FormGroup form;
  final bool showMealAddingProgress;

  const MealCardBody({
    super.key,
    required this.meal,
    required this.index,
    this.orderCount = 0,
    required this.initMealCountValue,
    required this.showMealAddingProgress,
    required this.form,
  });

  @override
  Widget build(BuildContext context) => JrContainer(
        width: double.infinity,
        borderColor: showMealAddingProgress ? context.colors.primary : context.colors.dark,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, Dimens.xm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 3 * 16 * 1.3 + 2 * Dimens.xm,
              padding: const EdgeInsets.all(Dimens.xm),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _titleColors[index % _titleColors.length],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Dimens.m),
                  topRight: Radius.circular(Dimens.m),
                ),
              ),
              child: JrText(
                meal.name,
                overflow: TextOverflow.ellipsis,
                color: context.colors.dark,
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: Dimens.s),
            JrPrice(
              size: JrPriceSize.l,
              price: meal.price,
            ),
            const SizedBox(height: Dimens.s),
            JrNumberEditField(
              form: form,
              formControlName: SelectMealFormControlName.count,
            ),
            const SizedBox(height: Dimens.xm),
          ],
        ),
      );
}
