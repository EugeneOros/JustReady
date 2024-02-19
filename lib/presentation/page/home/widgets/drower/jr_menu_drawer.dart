import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/home/home_page.dart';
import 'package:just_ready/presentation/page/home/widgets/drower/drower_item.dart';
import 'package:just_ready/presentation/widgets/jr_svg_picture.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';

const drawerWidth = Dimens.xmWidth;

class JrMenuDrawer extends StatelessWidget {
  final Function(int) onTap;
  final int selectedIndex;

  const JrMenuDrawer({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return MouseEdgeDetector(
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Drawer(
              width: drawerWidth,
              shape: Border.all(width: 0),
              backgroundColor: context.colors.transparent,
              child: Container(
                color: context.colors.dark.withOpacity(0.5),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        height: Dimens.bannerHeight,
                        alignment: Alignment.center,
                        child: JrSvgPicture(
                          IconsSvg.logo,
                          size: Dimens.xxxl,
                          color: context.colors.bright,
                        ),
                      ),
                      DrowerItem(
                        index: 0,
                        selectdIndex: selectedIndex,
                        title: Strings.of(context).addOrders,
                        selectedIcon: IconsSvg.bellRin24,
                        unselectedIcon: IconsSvg.bell24,
                        onTap: onTap,
                      ),
                      DrowerItem(
                        index: 1,
                        selectdIndex: selectedIndex,
                        title: Strings.of(context).orders,
                        selectedIcon: IconsSvg.ordersTorn24,
                        unselectedIcon: IconsSvg.orders24,
                        onTap: onTap,
                      ),
                      DrowerItem(
                        index: 2,
                        selectdIndex: selectedIndex,
                        title: Strings.of(context).meals,
                        selectedIcon: IconsSvg.mealHot24,
                        unselectedIcon: IconsSvg.meal24,
                        onTap: onTap,
                      ),
                      DrowerItem(
                        index: 3,
                        selectdIndex: selectedIndex,
                        title: Strings.of(context).dashboard,
                        selectedIcon: IconsSvg.boardDone24,
                        unselectedIcon: IconsSvg.boardProgress24,
                        onTap: onTap,
                      ),
                      const SizedBox(height: Dimens.xxc),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MouseEdgeDetector extends StatelessWidget {
  final Widget child;

  const MouseEdgeDetector({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerHover: (PointerEvent event) {
        final mousePosition = event.position.dx;
        if (mousePosition > drawerWidth) {
          homeKey.currentState!.closeDrawer();
        }
      },
      onPointerMove: (PointerEvent event) {
        final mousePosition = event.position.dx;
        const range = Dimens.xxl;
        if (drawerWidth - range <= mousePosition && mousePosition <= drawerWidth - Dimens.s) {
          homeKey.currentState!.closeDrawer();
        }
      },
      child: child,
    );
  }
}
