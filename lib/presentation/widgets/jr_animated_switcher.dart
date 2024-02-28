import 'package:animated_list_plus/transitions.dart';
import 'package:flutter/material.dart';

class JrAnimatedSwitcher extends StatelessWidget {
  final Widget child;
  const JrAnimatedSwitcher({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.topCenter,
        child: AnimatedSwitcher(
          transitionBuilder: (child, animation) => SizeFadeTransition(
            // scale: animation,
            animation: animation,
            child: ClipRect(
              child: child,
            ),
          ),
          duration: const Duration(milliseconds: 200),
          child: child,
        ),
      );
}
