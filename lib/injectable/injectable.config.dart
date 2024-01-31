// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/meals/data_source/meal_data_source.dart' as _i10;
import '../data/meals/mapper/meal_dto_to_meal_mapper.dart' as _i8;
import '../data/meals/mapper/meal_to_meal_dto_mapper.dart' as _i9;
import '../data/meals/repository/meals_repository_impl.dart' as _i12;
import '../data/orders/data_source/orders_data_source.dart' as _i16;
import '../data/orders/mapper/order_dto_to_order_mapper.dart' as _i13;
import '../data/orders/mapper/order_to_order_dto_mapper.dart' as _i14;
import '../data/orders/repository/order_repository_impl.dart' as _i18;
import '../domain/meals/meals_repository.dart' as _i11;
import '../domain/meals/use_case/add_meal_use_case.dart' as _i19;
import '../domain/meals/use_case/delete_meal_use_case.dart' as _i21;
import '../domain/meals/use_case/edit_meal_use_case.dart' as _i22;
import '../domain/meals/use_case/get_free_meal_number_use_case.dart' as _i5;
import '../domain/meals/use_case/get_meals_use_case.dart' as _i23;
import '../domain/meals/use_case/is_meal_number_taken_use_case.dart' as _i7;
import '../domain/orders/orders_repository.dart' as _i17;
import '../domain/orders/use_case/add_order_use_case.dart' as _i20;
import '../presentation/page/add_orders/cubit/add_orders_cubit.dart' as _i25;
import '../presentation/page/home/cubit/home_cubit.dart' as _i6;
import '../presentation/page/meals/cubit/meals_cubit.dart' as _i24;
import '../presentation/page/orders/cubit/orders_cubit.dart' as _i15;
import '../presentation/router/app_router.dart' as _i3;
import 'firestore_injectable.dart' as _i26;

const String _dev = 'dev';
const String _prod = 'prod';
const String _test = 'test';

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
  final firestoreModule = _$FirestoreModule();
  gh.singleton<_i3.AppRouter>(_i3.AppRouter());
  gh.singleton<_i4.FirebaseFirestore>(
    firestoreModule.firebaseFirestore,
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.factory<_i5.GetFreeMealNumberUseCase>(
      () => const _i5.GetFreeMealNumberUseCase());
  gh.factory<_i6.HomeCubit>(() => _i6.HomeCubit());
  gh.factory<_i7.IsMealNumberTakenUseCase>(
      () => const _i7.IsMealNumberTakenUseCase());
  gh.factory<_i8.MealDtoToMealMapper>(() => _i8.MealDtoToMealMapper());
  gh.factory<_i9.MealToMealDtoMapper>(() => _i9.MealToMealDtoMapper());
  gh.factory<_i10.MealsDataSource>(
      () => _i10.MealsDataSource(gh<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i11.MealsRepository>(() => _i12.MealsRepositoryImpl(
        gh<_i10.MealsDataSource>(),
        gh<_i9.MealToMealDtoMapper>(),
        gh<_i8.MealDtoToMealMapper>(),
      ));
  gh.factory<_i13.OrderDtoToOrderMapper>(() => _i13.OrderDtoToOrderMapper());
  gh.factory<_i14.OrderToOrderDtoMapper>(() => _i14.OrderToOrderDtoMapper());
  gh.factory<_i15.OrdersCubit>(() => _i15.OrdersCubit());
  gh.factory<_i16.OrdersDataSource>(
      () => _i16.OrdersDataSource(gh<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i17.OrdersRepository>(() => _i18.OrdersRepositoryImpl(
        gh<_i16.OrdersDataSource>(),
        gh<_i14.OrderToOrderDtoMapper>(),
      ));
  gh.factory<_i19.AddMealUseCase>(
      () => _i19.AddMealUseCase(gh<_i11.MealsRepository>()));
  gh.factory<_i20.AddOrderUseCase>(
      () => _i20.AddOrderUseCase(gh<_i17.OrdersRepository>()));
  gh.factory<_i21.DeleteMealUseCase>(
      () => _i21.DeleteMealUseCase(gh<_i11.MealsRepository>()));
  gh.factory<_i22.EditMealUseCase>(
      () => _i22.EditMealUseCase(gh<_i11.MealsRepository>()));
  gh.factory<_i23.GetMealsUseCase>(
      () => _i23.GetMealsUseCase(gh<_i11.MealsRepository>()));
  gh.factory<_i24.MealsCubit>(() => _i24.MealsCubit(
        gh<_i19.AddMealUseCase>(),
        gh<_i22.EditMealUseCase>(),
        gh<_i23.GetMealsUseCase>(),
        gh<_i21.DeleteMealUseCase>(),
        gh<_i5.GetFreeMealNumberUseCase>(),
        gh<_i7.IsMealNumberTakenUseCase>(),
      ));
  gh.factory<_i25.AddOrdersCubit>(() => _i25.AddOrdersCubit(
        gh<_i20.AddOrderUseCase>(),
        gh<_i23.GetMealsUseCase>(),
      ));
  return getIt;
}

class _$FirestoreModule extends _i26.FirestoreModule {}
