import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/add_orders/cubit/add_orders_cubit.dart';
import 'package:just_ready/presentation/page/add_orders/widgets/meal_number_item.dart';
import 'package:just_ready/presentation/page/add_orders/widgets/selected_meal_card.dart';
import 'package:just_ready/presentation/widgets/jr_animated_switcher.dart';
import 'package:just_ready/presentation/widgets/jr_app_bar.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../utils/hooks/use_once.dart';

class AddOrdersPage extends HookWidget {
  const AddOrdersPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<AddOrdersCubit>();
    final state = useBlocBuilder(cubit);
    useOnce(cubit.init);

    final selectedMealIndex = useState<int?>(null);

    return state.maybeWhen(
      loaded: (meals) => Scaffold(
        appBar: JrAppBar(
          title: Strings.of(context).addOrders,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: Dimens.l),
                    Wrap(
                      alignment: WrapAlignment.start,
                      direction: Axis.horizontal,
                      children: List.generate(
                        meals.length,
                        (index) => MealNumberItem(
                          number: meals[index].mealNumber,
                          isSelected: selectedMealIndex.value == index,
                          onSelect: (select) {
                            selectedMealIndex.value = select ? index : null;
                            // selectMealForm.control(SelectMealFormControlName.count).value = selectedMealIndex.value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimens.navBarHeight +
                          (selectedMealIndex.value != null ? Dimens.selectedMealCardHeight : 0) +
                          Dimens.l,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: Dimens.navBarHeight,
              right: 0,
              left: 0,
              child: JrAnimatedSeitcher(
                child: selectedMealIndex.value != null
                    ? SelctedMealCard(
                        meal: meals[selectedMealIndex.value!],
                        onAddMealToOrder: (mealCount) {
                          print(mealCount);
                          selectedMealIndex.value = null;
                        },
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
      orElse: SizedBox.shrink,
    );
  }

  void _onChange(
    FormGroup form,
    ValueNotifier<bool> isSignInButtonActive,
  ) =>
      isSignInButtonActive.value = form.valid;
}
