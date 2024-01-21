// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../presentation/page/add_orders/cubit/add_orders_cubit.dart' as _i3;
import '../presentation/page/home/cubit/home_cubit.dart' as _i5;
import '../presentation/page/orders/cubit/orders_cubit.dart' as _i6;
import '../presentation/router/app_router.dart' as _i4;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AddOrdersCubit>(() => _i3.AddOrdersCubit());
  gh.singleton<_i4.AppRouter>(_i4.AppRouter());
  gh.factory<_i5.HomeCubit>(() => _i5.HomeCubit());
  gh.factory<_i6.OrdersCubit>(() => _i6.OrdersCubit());
  return getIt;
}
