import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/presentation/widgets/jr_scale_container.dart';
import 'package:just_ready/presentation/widgets/poping_icons.dart';
import 'package:just_ready/styles/dimens.dart';

class JrDialog extends StatelessWidget {
  final Widget? titleIcon;
  final String title;
  final String actionText;
  final VoidCallback actionButtonOnTap;
  final VoidCallback? cancelButtonOnTap;
  final Widget? child;

  const JrDialog({
    super.key,
    this.titleIcon,
    required this.title,
    required this.actionText,
    required this.actionButtonOnTap,
    this.cancelButtonOnTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
        child: Stack(
          children: [
            const Center(child: PoppingIcons()),
            Center(
              child: JrPoppingContainer(
                child: AlertDialog(
                  backgroundColor: context.colors.transparent,
                  shadowColor: context.colors.transparent,
                  surfaceTintColor: context.colors.transparent,
                  contentPadding: const EdgeInsets.all(Dimens.zero),
                  content: Stack(
                    alignment: Alignment.center,
                    children: [
                      JrContainer(
                        showShadow: false,
                        height: Dimens.sHeight,
                        width: Dimens.sWidth,
                        margin: const EdgeInsets.symmetric(horizontal: Dimens.xm, vertical: Dimens.xm),
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            if (titleIcon != null) ...[
                              SizedBox(
                                height: Dimens.xxxl,
                                width: Dimens.xxxl,
                                child: titleIcon,
                              ),
                              const SizedBox(height: Dimens.s),
                            ],
                            const SizedBox(height: Dimens.m),
                            Text(
                              title,
                              style: context.typography.header4,
                            ),
                            if (child != null)
                              Expanded(
                                child: Center(
                                  child: child,
                                ),
                              ),
                            const SizedBox(height: Dimens.xl),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        bottom: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: Dimens.l),
                            Expanded(
                              child: Center(
                                child: JrButton(
                                  type: ButtonType.primary,
                                  title: actionText,
                                  onTap: actionButtonOnTap,
                                ),
                              ),
                            ),
                            if (cancelButtonOnTap != null) ...[
                              const SizedBox(width: Dimens.m),
                              Expanded(
                                child: Center(
                                  child: JrButton(
                                    type: ButtonType.secondary,
                                    title: Strings.of(context).cancel,
                                    onTap: cancelButtonOnTap!,
                                  ),
                                ),
                              ),
                            ],
                            const SizedBox(width: Dimens.l),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
