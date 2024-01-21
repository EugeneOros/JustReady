import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/presentation/page/orders/cubit/orders_cubit.dart';

class OrdersPage extends HookWidget {
  const OrdersPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<OrdersCubit>();
    final state = useBlocBuilder(cubit);
    // useOnce(cubit.getEventInfoList);

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Add your button click logic here
            print('Orders');
          },
          child: Text('Press Me'),
        ),
      ),
    );
  }
}
