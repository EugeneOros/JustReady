import 'package:flutter/material.dart';
import 'package:just_ready/presentation/widgets/jr_loader.dart';

class CreateOrderLoadingBody extends StatelessWidget {
  const CreateOrderLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: JrLoader(),
    );
  }
}
