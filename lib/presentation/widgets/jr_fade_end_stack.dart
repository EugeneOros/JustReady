import 'package:flutter/material.dart';
import 'package:just_ready/extensions/build_context_extension.dart';
import 'package:just_ready/presentation/widgets/jr_fade_scrollable_end.dart';
import 'package:just_ready/styles/dimens.dart';

class JrFadeEndStack extends StatelessWidget {
  final Widget child;
  final double topFadeHeight;
  final double bottomFadeHeight;
  const JrFadeEndStack({
    super.key,
    required this.child,
    this.topFadeHeight = Dimens.xl,
    this.bottomFadeHeight = Dimens.xl,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          child,
          JrFadeScrollableEnd(
            color: context.colors.bright,
            height: topFadeHeight,
            width: MediaQuery.of(context).size.width,
          ),
          JrFadeScrollableEnd(
            color: context.colors.bright,
            height: bottomFadeHeight,
            width: MediaQuery.of(context).size.width,
            isTop: false,
          ),
        ],
      );
}
