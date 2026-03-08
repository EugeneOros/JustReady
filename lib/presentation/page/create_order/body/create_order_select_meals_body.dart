import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/selected_meal_card/meal_card.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';
import 'package:just_ready/presentation/widgets/jr_bottom_box.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:collection/collection.dart';

class CreateOrderSelectMealsBody extends HookWidget {
  final List<Meal> meals;
  final Order? currentOrder;
  final Function(int, Meal) addMealToOrder;
  final VoidCallback onNext;

  const CreateOrderSelectMealsBody({
    super.key,
    required this.meals,
    required this.currentOrder,
    required this.addMealToOrder,
    required this.onNext,
  });

  bool get _hasMeals => currentOrder != null && currentOrder!.orderMeals.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);

    return Stack(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth > Dimens.lWidth ? 3 : 2;
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: Dimens.lWidth),
                child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(Dimens.l, Dimens.xm, Dimens.l, Dimens.xxxc),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: Dimens.xl,
                  mainAxisSpacing: Dimens.xl,
                  mainAxisExtent: 230,
                ),
                itemCount: meals.length,
                itemBuilder: (context, index) => MealCard(
                  meal: meals[index],
                  index: index,
                  orderCount: currentOrder?.orderMeals
                          .firstWhereOrNull((orderMeal) => orderMeal.meal.number == meals[index].number)
                          ?.count ??
                      0,
                  onAddToOrder: (number) {
                    addMealToOrder(number, meals[index]);
                  },
                  onMealAddedToOrder: (meal) {},
                ),
              ),
              ),
            );
          },
        ),
        if (_hasMeals)
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: JrBottomBox(
              buttons: [
                JrButton(
                  constraints: const BoxConstraints(
                    maxWidth: Dimens.buttonMaxWidth,
                  ),
                  width: double.infinity,
                  type: ButtonType.primary,
                  color: context.colors.dark,
                  textColor: context.colors.bright,
                  state: isLoading.value ? ButtonState.disabled : ButtonState.active,
                  title: Strings.of(context).goToSummary,
                  onTap: () {
                    isLoading.value = true;
                    onNext();
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}
