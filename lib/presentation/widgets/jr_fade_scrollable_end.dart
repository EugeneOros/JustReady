import 'package:flutter/material.dart';
import 'package:just_ready/styles/dimens.dart';

class JrFadeScrollableEnd extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final bool isTop;

  const JrFadeScrollableEnd({
    super.key,
    this.height = Dimens.s,
    this.color = Colors.white,
    this.isTop = true,
    this.width = Dimens.s,
  });

  @override
  Widget build(BuildContext context) => Positioned(
      top: isTop ? 0.0 : null,
      bottom: isTop ? null : 0.0,
      width: width,
      height: height,
      child: IgnorePointer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: isTop ? Alignment.topCenter : Alignment.bottomCenter,
              end: isTop ? Alignment.bottomCenter : Alignment.topCenter,
              stops: [0.0, 1.0],
              colors: [
                color,
                color.withOpacity(0.0),
              ],
            ),
          ),
        ),
      ),
    );
}
