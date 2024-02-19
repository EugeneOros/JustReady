import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/selected_meal_card/widgets/animated_check.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/utils/hooks/use_once.dart';

class CardOverlay extends HookWidget {
  final Function()? onFinishAnimation;
  const CardOverlay({
    super.key,
    this.onFinishAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final progressController = useAnimationController(duration: const Duration(milliseconds: 300));
    late Animation<double> progressAnimation = CurvedAnimation(parent: progressController, curve: Curves.linear);
    final isProgressAnimationReady = useState(false);

    useOnce(() {
      progressController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          isProgressAnimationReady.value = true;
        }
      });
      progressController.forward();
    });

    return Container(
      margin: const EdgeInsets.all(Dimens.xm),
      width: double.infinity,
      height: Dimens.mMaxCardHeight,
      child: Stack(
        children: [
          SizeTransition(
            sizeFactor: progressAnimation,
            axis: Axis.horizontal,
            axisAlignment: -1,
            child: Center(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.ms),
                  color: context.colors.primary.withOpacity(0.2),
                ),
                height: Dimens.mMaxCardHeight,
              ),
            ),
          ),
          Positioned(
            child: isProgressAnimationReady.value
                ? Center(
                    child: AnimatedCheck(
                      onFinishAnimation: onFinishAnimation,
                    ),
                  )
                : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
