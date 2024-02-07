import 'package:flutter/material.dart';
import 'package:just_ready/presentation/widgets/jr_loader.dart';

class MealsLoadingBody extends StatelessWidget {
  const MealsLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: JrLoader(),
    );
  }
}
