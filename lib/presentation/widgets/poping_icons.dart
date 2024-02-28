import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_ready/presentation/widgets/flying_icon.dart';
import 'package:just_ready/presentation/widgets/jr_svg_picture.dart';
import 'package:just_ready/utils/food_icons.dart';

class PoppingIcons extends StatelessWidget {
  const PoppingIcons({super.key});

  @override
  Widget build(BuildContext context) {
    

    final random = Random();

    return Stack(
      children: List.generate(
        foodIcons.length,
        (index) {
          final randomAngle = random.nextDouble() * 2 * pi; // Random angle between 0 and 2π
          final randomDuration =
              Duration(milliseconds: 1000 + random.nextInt(3000)); // Random duration between 500 and 2000 milliseconds
          final randomRotationSpeed = (random.nextDouble() - 0.5) * 4 * pi; // Random rotation speed between -2π and 2π

          return FlyingIcon(
            angle: randomAngle,
            rotationSpeed: randomRotationSpeed,
            duration: randomDuration, // Add random rotation
            child: JrSvgPicture(
              foodIcons[index],
              // color: context.colors.dark,
            ),
          );
        },
      ),
    );
  }
}
