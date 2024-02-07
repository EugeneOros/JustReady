import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/styles/dimens.dart';

class JrLoader extends StatelessWidget {
  final Color? color;
  final double size;

  const JrLoader({
    super.key,
    this.color,
    this.size = Dimens.xl,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: Dimens.xxs,
          color: color ?? context.colors.dark,
        ),
      );
}
