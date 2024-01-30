import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/styles/dimens.dart';

class JrContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final double borderWidth;
  final double borderOffset;
  final Color borderColor;
  final double borderRadius;
  final bool isAnimated;
  const JrContainer({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.height,
    this.width,
    this.borderWidth = Dimens.xxxs,
    this.borderOffset = Dimens.xxs,
    this.borderColor = Colors.black,
    this.borderRadius = Dimens.m,
    this.isAnimated = false,
  });

  @override
  Widget build(BuildContext context) {
    return getContainer(
      child: IntrinsicHeight(
        child: Stack(
          children: [
            Positioned(
              left: borderOffset,
              right: 0,
              top: borderOffset,
              bottom: 0,
              child: Container(
                margin: margin,
                padding: padding,
                decoration: BoxDecoration(
                  border: Border.all(color: context.colors.dark, width: borderWidth),
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: borderColor,
                ),
                child: child,
              ),
            ),
            Positioned(
              left: 0,
              right: borderOffset,
              top: 0,
              bottom: borderOffset,
              child: Container(
                margin: margin,
                padding: padding,
                decoration: BoxDecoration(
                  border: Border.all(color: context.colors.dark, width: borderWidth),
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: context.colors.background,
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getContainer({required Widget child}) => isAnimated
      ? AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          height: height,
          width: width,
          child: child,
        )
      : SizedBox(
          height: height,
          width: width,
          child: child,
        );
}
