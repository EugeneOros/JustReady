import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:intl/intl.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/home/home_page.dart';
import 'package:just_ready/presentation/page/statistics/cubit/statistics_cubit.dart';
import 'package:just_ready/presentation/page/statistics/cubit/statistics_state.dart';
import 'package:just_ready/presentation/page/orders/body/orders_loading_body.dart';
import 'package:just_ready/presentation/page/statistics/widgets/statistic_card.dart';
import 'package:just_ready/presentation/widgets/jr_app_bar.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';
import 'package:just_ready/utils/hooks/use_once.dart';

class StatisticsPage extends HookWidget {
  const StatisticsPage({super.key});

  static final _dateFormat = DateFormat('dd.MM.yyyy');

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<StatisticsCubit>();
    final state = useBlocBuilder(cubit, buildWhen: _buildWhen);
    useOnce(cubit.loadOrders);

    return Scaffold(
      appBar: JrAppBar(
        title: Strings.of(context).statistics,
        skipStartIcon: false,
        startIcon: IconsSvg.menu24,
        onStartIconTap: (_) => homeKey.currentState!.openDrawer(),
      ),
      body: state.maybeWhen(
        loaded: (orderMealsMap, totalPrice, availableDates, selectedDate) => Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: Dimens.lWidth,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(Dimens.m, Dimens.m, Dimens.m, Dimens.s),
                  child: JrText(
                    'Łączna cena: ${totalPrice.toStringAsFixed(2)} zł',
                    style: context.typography.header3,
                  ),
                ),
                SizedBox(
                  height: Dimens.xxl,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: Dimens.m),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: Dimens.s),
                        child: ChoiceChip(
                          label: const Text('Wszystkie'),
                          selected: selectedDate == null,
                          onSelected: (_) => cubit.selectDate(null),
                        ),
                      ),
                      ...availableDates.map((date) => Padding(
                            padding: const EdgeInsets.only(right: Dimens.s),
                            child: ChoiceChip(
                              label: Text(_dateFormat.format(date)),
                              selected: selectedDate != null &&
                                  selectedDate.year == date.year &&
                                  selectedDate.month == date.month &&
                                  selectedDate.day == date.day,
                              onSelected: (_) => cubit.selectDate(date),
                            ),
                          )),
                    ],
                  ),
                ),
                Expanded(
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
              ],
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
