import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/styles/dimens.dart';
// import 'package:hooked_bloc/hooked_bloc.dart';
// import 'package:just_ready/presentation/page/orders/cubit/orders_cubit.dart';

class OrdersPage extends HookWidget {
  const OrdersPage({super.key});
  @override
  Widget build(BuildContext context) {
    // final cubit = useBloc<OrdersCubit>();
    // final state = useBlocBuilder(cubit);
    // useOnce(cubit.getEventInfoList);

    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(Dimens.s),
                  alignment: Alignment.center,
                  color: context.colors.primary,
                  child: Text(
                    'title',
                    style: context.typography.body1.copyWith(
                      color: context.colors.background,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
