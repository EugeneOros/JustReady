import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/presentation/page/add_orders/cubit/add_orders_cubit.dart';

class AddOrdersPage extends HookWidget {
  const AddOrdersPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<AddOrdersCubit>();
    final state = useBlocBuilder(cubit);
    // useOnce(cubit.getEventInfoList);

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Add your button click logic here
            print('Button Pressed');
          },
          child: Text('Press Me To Add'),
        ),
      ),
    );
  }
}
