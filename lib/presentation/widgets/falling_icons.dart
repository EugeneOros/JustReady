import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FallingIconsWidget extends HookWidget {
  const FallingIconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FallingIcon> fallingIcons = [];
    useStream(Stream.periodic(const Duration(seconds: 1)), initialData: (_) {
      _generateFallingIcon(fallingIcons, context);
    });

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // color: Colors.white,
      child: Stack(
        children: [
          for (var fallingIcon in fallingIcons)
            Positioned(
              top: fallingIcon.top,
              left: fallingIcon.position,
              child: Icon(
                fallingIcon.icon,
                size: 32,
                color: Colors.red,
              ),
            ),
        ],
      ),
    );
  }

  void _generateFallingIcon(List<FallingIcon> fallingIcons, BuildContext context) {
    final List<IconData> icons = [Icons.star, Icons.favorite, Icons.access_alarm, Icons.cloud, Icons.ac_unit];
    final random = Random();
    final icon = icons[random.nextInt(icons.length)];
    final position = random.nextDouble() * (MediaQuery.of(context).size.width - 50);
    fallingIcons.add(FallingIcon(icon: icon, position: position, top: -32));
  }
}

class FallingIcon {
  final IconData icon;
  final double position;
  double top;

  FallingIcon({required this.icon, required this.position, required this.top});
}
