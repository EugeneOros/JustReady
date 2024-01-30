import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';

class NumberCircle extends StatelessWidget {
  final int number;
  const NumberCircle({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimens.xxl,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colors.secondary, // Color of the circle
      ),
      child: Center(
        child: JrText(
          number.toString(),
          color: context.colors.background,
        ),
      ),
    );
  }
}
