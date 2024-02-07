import 'package:flutter/material.dart';
import 'package:just_ready/presentation/widgets/jr_loader.dart';

class SlectMealsLoadingBody extends StatelessWidget {
  const SlectMealsLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: JrLoader(),
    );
  }
}
