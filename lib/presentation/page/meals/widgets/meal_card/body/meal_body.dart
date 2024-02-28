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
    // final scaleController = useAnimationController(duration: const Duration(milliseconds: 500));
    // late Animation<double> scaleAnimation = CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);
    // final checkController = useAnimationController(duration: const Duration(milliseconds: 300));
    // late Animation<double> checkAnimation = CurvedAnimation(parent: checkController, curve: Curves.linear);

    // useOnce(() {
    //   checkController.addStatusListener((status) {
    //     if (status == AnimationStatus.completed && onFinishAnimation != null) {
    //       onFinishAnimation!();
    //     }
    //   });
    //   scaleController.addStatusListener((status) {
    //     if (status == AnimationStatus.completed) {
    //       checkController.forward();
    //     }
    //   });
    //   scaleController.forward();
    // });

    return JrAnimatedSwitcher(
      child: isEditing
          ? SingleChildScrollView(
              child: MealEditingBody(
                meal: meal,
                form: form,
                icon: actionIcon,
              ),
            )
          : MealDefaultBody(
              meal: meal,
            ),
    );
  }
}
