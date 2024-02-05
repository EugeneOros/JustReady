import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/create_order/widgets/order_card.dart';
import 'package:just_ready/presentation/page/create_order/widgets/order_meal_card.dart';
import 'package:just_ready/presentation/router/route_name.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';
import 'package:just_ready/presentation/widgets/jr_app_bar.dart';
import 'package:just_ready/styles/dimens.dart';

class CreateOrderLoadedBody extends StatelessWidget {
  final Order order;
  const CreateOrderLoadedBody({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: JrAppBar(
        title: Strings.of(context).createOrder,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: Dimens.navBarHeight),
        child: OrderCard(
          order: order,
          child: ListView.builder(
            itemCount: order.meals.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return OrderMealCard(
                orderMeal: order.meals[index],
                onEdit: (meal) => {},
                onDelete: (mealId) => {},
              );
            },
          ),
        ),
      ),
    );
  }
}
