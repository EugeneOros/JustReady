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
  final Color? backgroundColor;
  final bool showShadow;
  final Function()? onTap;
  final BoxConstraints? constraints;
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
    this.backgroundColor,
    this.showShadow = false,
    this.onTap,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) => getContainer(
        context,
        child: Stack(
          children: [
            Positioned(
              left: borderOffset,
              right: 0,
              top: borderOffset,
              bottom: 0,
              child: Container(
                padding: padding,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor, width: borderOffset + Dimens.xxs),
                  borderRadius: BorderRadius.circular(borderRadius),
                  // color: borderColor,
                  boxShadow: showShadow
                      ? [
                          BoxShadow(
                            color: context.colors.darkLight.withOpacity(0.5),
                            spreadRadius: Dimens.xxxs,
                            blurRadius: Dimens.xs,
                            offset: const Offset(Dimens.xxs, Dimens.xxs),
                          ),
                        ]
                      : null,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: borderOffset,
              top: 0,
              bottom: borderOffset,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor, width: borderWidth),
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: context.colors.transparent,
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: backgroundColor ?? context.colors.bright,
                  child: InkWell(
                    highlightColor: context.colors.transparent,
                    splashColor: context.colors.primary,
                    hoverColor: context.colors.darkLight,
                    borderRadius: BorderRadius.circular(borderRadius),
                    onTap: onTap,
                    child: Container(
                      padding: padding,
                      child: child,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget getContainer(BuildContext context, {required Widget child}) => isAnimated
      ? AnimatedContainer(
          margin: margin,
          color: context.colors.transparent,
          constraints: constraints,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          height: height,
          width: width,
          child: child,
        )
      : Container(
          margin: margin,
          color: context.colors.transparent,
          alignment: Alignment.center,
          constraints: constraints,
          height: height,
          width: width,
          child: child,
        );
}
