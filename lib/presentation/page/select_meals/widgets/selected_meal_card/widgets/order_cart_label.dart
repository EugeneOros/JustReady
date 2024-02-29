import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/jr_svg_picture.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';

class OrderCartLable extends StatelessWidget {
  final int number;
  const OrderCartLable({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(Dimens.xm),
          child: JrSvgPicture(
            IconsSvg.cart24,
            color: context.colors.dark,
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colors.bright,
            ),
            padding: const EdgeInsets.all(Dimens.xxs),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colors.secondary,
              ),
              width: Dimens.ms,
              height: Dimens.ms,
              child: Center(
                child: JrText(
                  number.toString(),
                  color: context.colors.bright,
                  style: context.typography.subtitle2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
