import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/presentation/widgets/jr_scale_container.dart';
import 'package:just_ready/presentation/widgets/jr_svg_picture.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/presentation/widgets/poping_icons.dart';
import 'package:just_ready/presentation/widgets/rotating_widget.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';
import 'package:just_ready/utils/food_icons.dart';

class JrNumberDialog extends StatelessWidget {
  final String title;
  final TextStyle? titleTextStyle;
  final int number;

  final String? actionText;
  final VoidCallback? actionButtonOnTap;

  const JrNumberDialog({
    super.key,
    required this.title,
    required this.number,
    this.actionText,
    this.actionButtonOnTap,
    this.titleTextStyle,
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
                        height: Dimens.numberDialogHeight,
                        width: Dimens.mWidth,
                        margin: const EdgeInsets.fromLTRB(Dimens.xm, Dimens.xxxc, Dimens.xm, Dimens.xm),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            const SizedBox(height: Dimens.m),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(horizontal: Dimens.xm, vertical: Dimens.m),
                                child: Text(
                                  title,
                                  style: titleTextStyle ?? context.typography.header2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (actionText != null && actionButtonOnTap != null)
                        Positioned(
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: Center(
                            child: JrButton(
                              type: ButtonType.primary,
                              title: actionText!,
                              onTap: actionButtonOnTap!,
                            ),
                          ),
                        ),
                      Positioned(
                        right: 0,
                        left: 0,
                        top: 0,
                        child: Center(
                          child: SizedBox(
                            height: Dimens.xsWidth,
                            width: Dimens.xsWidth,
                            child: Image.asset(
                              Illustrations.plate,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        top: 0,
                        child: Container(
                          height: Dimens.xsWidth,
                          width: Dimens.xsWidth,
                          padding: const EdgeInsets.only(bottom: Dimens.xs, right: Dimens.xs),
                          alignment: Alignment.center,
                          child: JrText(
                            number.toString(),
                            color: context.colors.dark,
                            style: context.typography.header1,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        top: Dimens.xxc,
                        child: Center(
                          child: RotatingWidget(
                            distanceFromCenter: Dimens.xsWidth,
                            clockwise: true,
                            child: JrSvgPicture(getRandomFoodIcon(), size: Dimens.xl),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        top: Dimens.xxc,
                        child: Center(
                          child: RotatingWidget(
                            distanceFromCenter: Dimens.sWidth,
                            clockwise: false,
                            child: JrSvgPicture(getRandomFoodIcon(), size: Dimens.xxl),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        top: Dimens.xxc,
                        child: Center(
                          child: RotatingWidget(
                            distanceFromCenter: Dimens.xmWidth,
                            clockwise: false,
                            duration: const Duration(milliseconds: 10000),
                            startAngle: pi,
                            child: JrSvgPicture(getRandomFoodIcon(), size: Dimens.c),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        top: Dimens.xxc,
                        child: Center(
                          child: RotatingWidget(
                            distanceFromCenter: Dimens.mWidth,
                            duration: const Duration(milliseconds: 15000),
                            clockwise: true,
                            startAngle: pi / 3,
                            child: JrSvgPicture(getRandomFoodIcon(), size: Dimens.xc),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
