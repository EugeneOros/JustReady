import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/router/route_name.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';
import 'package:just_ready/presentation/widgets/jr_app_bar.dart';

class CreateOrderLoadedEmptyBody extends StatelessWidget {
  const CreateOrderLoadedEmptyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JrAppBar(
        title: Strings.of(context).createOrder,
      ),
      body: JrButton(
        onTap: () => context.goNamed(JustReadyRoute.selectMeals.name),
        title: Strings.of(context).addOrders,
      ),
    );
  }
}
