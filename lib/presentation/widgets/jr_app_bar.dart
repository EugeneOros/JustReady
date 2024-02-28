import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_icon_button.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';

class JrAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? startIcon;
  final String? endIcon;
  final void Function(BuildContext)? onStartIconTap;
  final void Function(BuildContext)? onEndIconTap;
  final bool skipStartIcon;
  final Color? backgroundColor;
  final Color? titleColor;

  const JrAppBar({
    super.key,
    this.title = '',
    this.startIcon,
    this.endIcon,
    this.onStartIconTap,
    this.onEndIconTap,
    this.skipStartIcon = true,
    this.backgroundColor,
    this.titleColor,
  });

  @override
  Size get preferredSize => const Size.fromHeight(Dimens.bannerHeight);

  @override
  Widget build(BuildContext context) => Material(
        color: context.colors.transparent,
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              width: MediaQuery.of(context).size.width,
              height: Dimens.bannerHeight,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 1.0],
                    colors: [
                      context.colors.dark,
                      context.colors.dark.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  color: context.colors.transparent,
                  height: Dimens.bannerHeight,
                  width: double.infinity,
                  child: Opacity(
                    opacity: 0.9,
                    child: Image.asset(
                      Illustrations.banner,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: context.colors.transparent,
              height: Dimens.bannerHeight,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: Dimens.xxc),
              alignment: Alignment.center,
              child: JrText(
                title,
                textAlign: TextAlign.center,
                color: context.colors.bright,
                style: context.typography.header2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: Dimens.m,
                top: Dimens.m,
                left: Dimens.m,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (!skipStartIcon) _buildStartIcon(context),
                  const Spacer(),
                  if (endIcon != null)
                    JrIconButton(
                      type: IconButtonType.primary,
                      icon: endIcon!,
                      onTap: () => onEndIconTap?.call(context),
                    )
                ],
              ),
            )
          ],
        ),
      );

  Widget _buildStartIcon(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: Dimens.l),
        child: Builder(builder: (context) {
          return JrIconButton(
            type: IconButtonType.secondary,
            icon: startIcon ?? IconsSvg.chevronLeft24,
            onTap: () => onStartIconTap != null ? onStartIconTap!(context) : context.pop(),
          );
        }),
      );

  Widget _buildEndIcon(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: Dimens.xl),
        child: JrIconButton(
          type: IconButtonType.primary,
          icon: endIcon!,
          onTap: () => onEndIconTap?.call(context),
        ),
      );
}
