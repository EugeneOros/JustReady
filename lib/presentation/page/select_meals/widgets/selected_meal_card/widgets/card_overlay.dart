import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/selected_meal_card/widgets/animated_check.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/utils/hooks/use_once.dart';

const _progressDuration = Duration(milliseconds: 200);
const _fadeDuration = Duration(milliseconds: 200);
const _finishDelay = Duration(milliseconds: 150);

class CardOverlay extends HookWidget {
  final Function()? onFinishAnimation;
  const CardOverlay({
    super.key,
    this.onFinishAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final progressController = useAnimationController(duration: const Duration(milliseconds: 200));
    late Animation<double> progressAnimation = CurvedAnimation(parent: progressController, curve: Curves.linear);
    final isProgressAnimationReady = useState(false);

    final fadeController = useAnimationController(duration: const Duration(milliseconds: 200));
    late Animation<double> fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(fadeController);

    useOnce(() {
      fadeController.addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          await Future.delayed(const Duration(milliseconds: 150));
          if (onFinishAnimation != null) onFinishAnimation!();
        }
      });
      progressController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          isProgressAnimationReady.value = true;
        }
      });
      progressController.forward();
    });

    return FadeTransition(
      opacity: fadeAnimation,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SizeTransition(
              sizeFactor: progressAnimation,
              axis: Axis.horizontal,
              axisAlignment: -1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.m),
                  color: context.colors.primary.withOpacity(0.2),
                ),
              ),
            ),
            Positioned(
              child: isProgressAnimationReady.value
                  ? Center(
                      child: AnimatedCheck(
                        onFinishAnimation: () => fadeController.forward(),
                      ),
                    )
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}
