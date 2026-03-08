import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/styles/dimens.dart';

class CreateOrderStepIndicator extends StatelessWidget {
  final int currentStep;

  const CreateOrderStepIndicator({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: Dimens.buttonBoxChildMaxWidth),
        padding: const EdgeInsets.symmetric(horizontal: Dimens.xl, vertical: Dimens.m),
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              _StepCircle(
                number: 1,
                isActive: currentStep == 1,
                isCompleted: currentStep > 1,
              ),
              Expanded(
                child: _AnimatedProgressBar(progress: currentStep >= 2 ? 1.0 : 0.0),
              ),
              _StepCircle(
                number: 2,
                isActive: currentStep == 2,
                isCompleted: currentStep > 2,
              ),
            ],
          ),
          const SizedBox(height: Dimens.xs),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.of(context).selectMeal,
                style: context.typography.body2.copyWith(
                  color: currentStep >= 1 ? context.colors.dark : context.colors.disabled,
                ),
              ),
              Text(
                Strings.of(context).summary,
                style: context.typography.body2.copyWith(
                  color: currentStep >= 2 ? context.colors.dark : context.colors.darkLight,
                ),
              ),
            ],
          ),
        ],
        ),
      ),
    );
  }
}

class _StepCircle extends StatelessWidget {
  final int number;
  final bool isActive;
  final bool isCompleted;

  const _StepCircle({
    required this.number,
    required this.isActive,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final isHighlighted = isActive || isCompleted;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: Dimens.xl,
      height: Dimens.xl,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isHighlighted ? context.colors.dark : context.colors.bright,
        border: Border.all(
          color: isHighlighted ? context.colors.dark : context.colors.darkLight,
          width: Dimens.xxs,
        ),
      ),
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isCompleted
              ? Icon(
                  Icons.check,
                  key: const ValueKey('check'),
                  size: Dimens.ms,
                  color: context.colors.bright,
                )
              : Text(
                  '$number',
                  key: ValueKey('number_$number'),
                  style: context.typography.body2.copyWith(
                    color: isActive ? context.colors.bright : context.colors.darkLight,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}

class _AnimatedProgressBar extends StatelessWidget {
  final double progress;

  const _AnimatedProgressBar({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.s),
      child: TweenAnimationBuilder<double>(
        tween: Tween(end: progress),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        builder: (context, value, _) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    height: Dimens.xxs,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: context.colors.bright,
                      borderRadius: BorderRadius.circular(Dimens.xxs),
                    ),
                  ),
                  Container(
                    height: Dimens.xxs,
                    width: constraints.maxWidth * value,
                    decoration: BoxDecoration(
                      color: context.colors.dark,
                      borderRadius: BorderRadius.circular(Dimens.xxs),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
