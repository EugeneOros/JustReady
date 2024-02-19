import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/extensions/build_context_extension.dart';
import 'package:just_ready/presentation/widgets/jr_svg_picture.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';
import 'package:just_ready/utils/hooks/use_once.dart';

const borderOffset = Dimens.xxs;

class AnimatedCheck extends HookWidget {
  final Function()? onFinishAnimation;

  const AnimatedCheck({
    super.key,
    this.onFinishAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final scaleController = useAnimationController(duration: const Duration(milliseconds: 500));
    late Animation<double> scaleAnimation = CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);
    final checkController = useAnimationController(duration: const Duration(milliseconds: 300));
    late Animation<double> checkAnimation = CurvedAnimation(parent: checkController, curve: Curves.linear);
    double circleSize = Dimens.c;
    double iconSize = Dimens.xl;

    useOnce(() {
      checkController.addStatusListener((status) {
        if (status == AnimationStatus.completed && onFinishAnimation != null) {
          onFinishAnimation!();
        }
      });
      scaleController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          checkController.forward();
        }
      });
      scaleController.forward();
    });

    return SizedBox(
      height: circleSize,
      width: circleSize,
      child: Stack(
        children: [
          Center(
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Stack(
                children: [
                  Positioned(
                    left: borderOffset,
                    right: 0,
                    top: borderOffset,
                    bottom: 0,
                    child: Container(
                      height: circleSize,
                      width: circleSize,
                      decoration: BoxDecoration(
                        color: context.colors.dark,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: borderOffset,
                    top: 0,
                    bottom: borderOffset,
                    child: Container(
                      height: circleSize,
                      width: circleSize,
                      decoration: BoxDecoration(
                        color: context.colors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: context.colors.dark,
                          width: Dimens.xxxs,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: checkAnimation,
            axis: Axis.horizontal,
            axisAlignment: -1,
            child: Center(
              child: JrSvgPicture(
                IconsSvg.check24,
                color: context.colors.bright,
                size: iconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
