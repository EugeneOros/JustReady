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
              alignment: Alignment.center,
              child: JrText(
                title,
                color: context.colors.background,
                style: context.typography.header1,
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
                      onPressed: () => onEndIconTap?.call(context),
                    )
                ],
              ),
            )
          ],
        ),
      );

  // AppBar(
  //       scrolledUnderElevation: 0,
  //       elevation: 0,
  //       bottomOpacity: 0.0,
  //       shadowColor: context.colors.transparent,
  //       backgroundColor: backgroundColor ?? context.colors.primary,
  //       leading: skipStartIcon ? null : _buildStartIcon(context),
  //       automaticallyImplyLeading: !skipStartIcon,
  //       flexibleSpace: Container(
  //         decoration: BoxDecoration(
  //           image: DecorationImage(
  //             image: AssetImage(Illustrations.banner), // Replace with your image path
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //       ),
  //       title: JrText(
  //         title,
  //         style: context.typography.header1,
  //         color: titleColor ?? context.colors.background,
  //       ),
  //       centerTitle: true,
  //       titleSpacing: Dimens.zero,
  //       actions: [if (endIcon != null) _buildEndIcon(context)],
  //       bottom: const PreferredSize(
  //         preferredSize: Size.fromHeight(Dimens.m),
  //         child: SizedBox.shrink(),
  //       ),
  //     );

  Widget _buildStartIcon(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: Dimens.l),
        child: JrIconButton(
          type: IconButtonType.secondary,
          icon: startIcon ?? IconsSvg.chevronLeft24,
          onPressed: () => onStartIconTap != null ? onStartIconTap!(context) : context.pop(),
        ),
      );

  Widget _buildEndIcon(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: Dimens.xl),
        child: JrIconButton(
          type: IconButtonType.primary,
          icon: endIcon!,
          onPressed: () => onEndIconTap?.call(context),
        ),
        //  InkWell(
        //   onTap: () => onEndIconTap?.call(context),
        //   child: JrSvgPicture(
        //     endIcon!,
        //     color: titleColor ?? context.colors.background,
        //   ),
        // ),
      );
}
