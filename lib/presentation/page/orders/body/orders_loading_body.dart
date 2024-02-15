import 'package:flutter/material.dart';
import 'package:just_ready/presentation/widgets/jr_loader.dart';

class OrdersLoadingBody extends StatelessWidget {
  const OrdersLoadingBody({super.key});

  @override
  Widget build(BuildContext context) => const Center(
      child: JrLoader(),
    );
}
