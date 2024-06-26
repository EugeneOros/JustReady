import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/jr_svg_picture.dart';
import 'package:just_ready/styles/dimens.dart';

enum ButtonType {
  primary,
  secondary,
  tertiary,
}

enum ButtonState {
  active,
  loading,
  disabled,
}

class JrButton extends HookWidget {
  final String title;
  final VoidCallback onTap;
  final ButtonType type;
  final ButtonState state;
  final String? prefixIcon;
  final String? sufixIcon;
  final Color? color;
  final double? width;
  final BoxConstraints? constraints;
  final Color? textColor;

  const JrButton({
    super.key,
    required this.title,
    required this.onTap,
    this.type = ButtonType.primary,
    this.state = ButtonState.active,
    this.prefixIcon,
    this.sufixIcon,
    this.color,
    this.width,
    this.constraints,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);
    final bordrRadius = BorderRadius.circular(Dimens.xl);

    return Material(
      color: _getBackgroundColor(context),
      borderRadius: bordrRadius,
      child: InkWell(
        onTap: state == ButtonState.disabled ? null : onTap,
        highlightColor: context.colors.transparent,
        splashColor: _getSplashColor(context),
        hoverColor: context.colors.darkLight,
        onHover: (value) => isHover.value = value,
        borderRadius: bordrRadius,
        child: Container(
          width: width,
          constraints: constraints,
          decoration: BoxDecoration(
            borderRadius: bordrRadius,
            border: Border.all(color: _getBordersColor(context), width: Dimens.xxxs),
            color: context.colors.transparent, // isHover.value ? context.colors.dark : context.colors.bright,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIcon != null)
                JrSvgPicture(
                  prefixIcon!,
                  size: Dimens.xl,
                  color: _getTitleColor(context),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimens.xs, horizontal: Dimens.xm),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: context.typography.button.copyWith(
                    color: _getTitleColor(context),
                  ),
                ),
              ),
              if (sufixIcon != null)
                JrSvgPicture(
                  sufixIcon!,
                  size: Dimens.xl,
                  color: _getTitleColor(context),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getBordersColor(BuildContext context) {
    if (state == ButtonState.disabled) return context.colors.disabled;
    return context.colors.dark;
  }

  Color _getTitleColor(BuildContext context) {
    if(textColor != null) return textColor!;
    if (state == ButtonState.disabled) return context.colors.disabled;
    switch (type) {
      case ButtonType.primary:
        return context.colors.dark;
      case ButtonType.secondary:
        return context.colors.dark;
      case ButtonType.tertiary:
        return color ?? context.colors.primary;
    }
  }

  Color _getBackgroundColor(BuildContext context) {
    if (state == ButtonState.disabled) return context.colors.bright;
    switch (type) {
      case ButtonType.primary:
        return color ?? context.colors.primary;
      case ButtonType.secondary:
        return context.colors.bright;
      case ButtonType.tertiary:
        return context.colors.bright;
    }
  }

  Color _getSplashColor(BuildContext context) {
    switch (type) {
      case ButtonType.primary:
        return context.colors.bright;
      case ButtonType.secondary:
        return color ?? context.colors.primary;
      case ButtonType.tertiary:
        return context.colors.dark;
    }
  }
}
