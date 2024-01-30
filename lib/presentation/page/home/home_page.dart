import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/page/home/cubit/home_cubit.dart';
import 'package:just_ready/presentation/page/home/cubit/home_state.dart';
import 'package:just_ready/presentation/page/home/widgets/home_nav_bar.dart';
import 'package:just_ready/styles/dimens.dart';
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
    final cubit = useBloc<HomeCubit>();
    final state = useBlocBuilder(cubit, buildWhen: _buildWhen);
    useBlocListener(cubit, _listener);
    useOnce(() => cubit.init());

    return Scaffold(
      backgroundColor: context.colors.background,
      body: Stack(
        children: [
          Positioned.fill(child: child),
          Positioned(
            bottom: Dimens.zero,
            left: Dimens.zero,
            right: Dimens.zero,
            child: state.maybeWhen(
                selectedPage: (index, path) {
                  return HomeNavBar(
                    selectedIndex: index,
                    onTap: (int tapIndex) => cubit.selectPage(
                      NavTabs.values[tapIndex],
                    ),
                  );
                },
                orElse: () => const SizedBox.shrink()),
          )
        ],
      ),
    );
  }

  void _listener(HomeCubit cubit, HomeState state, BuildContext context) => state.maybeWhen(
        selectedPage: (index, path) => context.go(path),
        orElse: doNothing,
      );

  bool _buildWhen(HomeState state) => state is SelectedPageState;
}
