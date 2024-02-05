import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/presentation/page/create_order/body/create_order_loaded_body.dart';
import 'package:just_ready/presentation/page/create_order/body/create_order_loaded_empty_body.dart';
import 'package:just_ready/presentation/page/create_order/cubit/create_order_cubit.dart';
import 'package:just_ready/utils/hooks/use_once.dart';

class CreateOrderPage extends HookWidget {
  const CreateOrderPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<CreateOrderCubit>();
    final state = useBlocBuilder(cubit);
    useOnce(cubit.init);

    return state.maybeWhen(
      loadedEmpty: () => const CreateOrderLoadedEmptyBody(),
      loaded: (order) => CreateOrderLoadedBody(order: order),
      orElse: SizedBox.shrink,
    );
  }
}
