import 'package:flutter/material.dart';

class JrAnimatedSeitcher extends StatelessWidget {
  final Widget child;
  const JrAnimatedSeitcher({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: AnimatedSwitcher(
        
        // switchInCurve: Curves.fastEaseInToSlowEaseOut,
        // switchOutCurve: Curves.fastEaseInToSlowEaseOut,
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: animation,
          child: ClipRect(
            child: child,
          ),
        ),
        duration: const Duration(milliseconds: 150),
        child: child,
      ),
    );
  }
}
