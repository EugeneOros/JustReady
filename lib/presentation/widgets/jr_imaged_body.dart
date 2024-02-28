import 'package:flutter/material.dart';
import 'package:just_ready/styles/images.dart';

class JrImagedBody extends StatelessWidget {
  final Widget child;
  const JrImagedBody({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Stack(children: [
        Positioned.fill(
          child: Image.asset(
            Illustrations.dashboardBackground,
            fit: BoxFit.fitHeight,
          ),
        ),
        Positioned.fill(
          child: child,
        )
      ]);
}
