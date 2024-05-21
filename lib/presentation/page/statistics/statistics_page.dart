import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/presentation/page/statistics/cubit/statistics_cubit.dart';
import 'package:just_ready/presentation/page/statistics/cubit/statistics_state.dart';
import 'package:just_ready/presentation/page/orders/body/orders_loading_body.dart';
import 'package:just_ready/presentation/page/statistics/widgets/statistic_card.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/utils/hooks/use_once.dart';

class StatisticsPage extends HookWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<StatisticsCubit>();
    final state = useBlocBuilder(cubit, buildWhen: _buildWhen);
    useOnce(cubit.loadOrders);

    return Scaffold(
      body: state.maybeWhen(
        loaded: (orderMealsMap) => Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: Dimens.lWidth,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: orderMealsMap.length,
              itemBuilder: (context, index) {
                final meal = orderMealsMap.keys.elementAt(index);
                final statistic = orderMealsMap[meal];
                return statistic != null
                    ? StatisticCard(
                        meal: meal,
                        statistic: statistic,
                      )
                    : const SizedBox.shrink();
              },
            ),
          ),
        ),
        loading: () => const OrdersLoadingBody(),
        orElse: SizedBox.shrink,
      ),
    );
  }

  bool _buildWhen(StatisticsState state) => state is StatisticsStateBuilder;
}
