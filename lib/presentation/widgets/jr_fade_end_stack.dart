import 'package:flutter/material.dart';
import 'package:just_ready/extensions/build_context_extension.dart';
import 'package:just_ready/presentation/widgets/jr_fade_scrollable_end.dart';
import 'package:just_ready/styles/dimens.dart';

class JrFadeEndStack extends StatelessWidget {
  final Widget child;
  final double fadeHeight;
  const JrFadeEndStack({
    super.key,
    required this.child,
    this.fadeHeight = Dimens.xl,
  });

  @override
  Widget build(BuildContext context) => Stack(
      children: [
        child,
        JrFadeScrollableEnd(
          color: context.colors.bright,
          height: fadeHeight,
          width: MediaQuery.of(context).size.width,
        ),
        JrFadeScrollableEnd(
          color: context.colors.bright,
          height: fadeHeight,
          width: MediaQuery.of(context).size.width,
          isTop: false,
        ),
      ],
    );
}
