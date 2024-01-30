import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/presentation/page/meals/widgets/meal_card/body/meal_default_body.dart';
import 'package:just_ready/presentation/page/meals/widgets/meal_card/body/meal_editing_body.dart';
import 'package:just_ready/presentation/widgets/jr_animated_switcher.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MealCardBody extends HookWidget {
  final bool isEditing;
  final Meal meal;
  final FormGroup form;
  final String? actionIcon;
  const MealCardBody({
    super.key,
    required this.isEditing,
    required this.form,
    required this.meal,
    this.actionIcon,
  });

  @override
  Widget build(BuildContext context) {
    return JrAnimatedSeitcher(
      child: isEditing
          ? MealEditingBody(
              meal: meal,
              form: form,
              icon: actionIcon,
            )
          : MealDefaultBody(
              meal: meal,
            ),
    );
  }
}
