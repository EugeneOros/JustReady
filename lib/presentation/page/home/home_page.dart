import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/home/cubit/home_cubit.dart';
import 'package:just_ready/presentation/page/home/cubit/home_state.dart';
import 'package:just_ready/utils/hooks/use_once.dart';
import 'package:just_ready/utils/ignore_else_state.dart';

class HomePage extends HookWidget {
  final Widget child;

  const HomePage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.list),
        label: Strings.of(context).orders,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add),
        label: Strings.of(context).addOrders,
      )
    ];
    final cubit = useBloc<HomeCubit>();
    final state = useBlocBuilder(cubit, buildWhen: _buildWhen);
    useBlocListener(cubit, _listener);
    useOnce(() => cubit.init());

    return Scaffold(
        body: child,
        bottomNavigationBar: state.maybeWhen(
            selectedPage: (index, path) {
              return BottomNavigationBar(
                currentIndex: index,
                items: items,
                onTap: (int tapIndex) => cubit.selectPage(
                  NavTabs.values[tapIndex],
                ),
              );
            },
            orElse: () => const SizedBox.shrink()));
  }

  void _listener(HomeCubit cubit, HomeState state, BuildContext context) => state.maybeWhen(
        selectedPage: (index, path) => context.go(path),
        orElse: doNothing,
      );

  bool _buildWhen(HomeState state) => state is SelectedPageState;
}
