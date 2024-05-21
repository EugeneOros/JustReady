// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/main_stream/service/main_stream_service_impl.dart' as _i9;
import '../data/meals/data_source/meal_data_source.dart' as _i14;
import '../data/meals/mapper/meal_dto_to_meal_mapper.dart' as _i4;
import '../data/meals/mapper/meal_to_meal_dto_mapper.dart' as _i3;
import '../data/meals/repository/meals_repository_impl.dart' as _i22;
import '../data/orders/data_source/orders_data_source.dart' as _i15;
import '../data/orders/mapper/order_dto_to_order_mapper.dart' as _i18;
import '../data/orders/mapper/order_meal_dto_to_order_meal_mapper.dart' as _i10;
import '../data/orders/mapper/order_meal_to_order_meal_dto_mapper.dart' as _i11;
import '../data/orders/mapper/order_to_order_dto_mapper.dart' as _i13;
import '../data/orders/repository/order_repository_impl.dart' as _i20;
import '../domain/main_stream/service/main_stream_service.dart' as _i8;
import '../domain/main_stream/usecase/notify_main_stream_use_case.dart' as _i17;
import '../domain/main_stream/usecase/subscribe_main_stream_use_case.dart'
    as _i16;
import '../domain/meals/meals_repository.dart' as _i21;
import '../domain/meals/use_case/add_meal_use_case.dart' as _i38;
import '../domain/meals/use_case/delete_meal_use_case.dart' as _i36;
import '../domain/meals/use_case/edit_meal_use_case.dart' as _i37;
import '../domain/meals/use_case/get_free_meal_number_use_case.dart' as _i5;
import '../domain/meals/use_case/get_meals_use_case.dart' as _i35;
import '../domain/meals/use_case/is_meal_number_taken_use_case.dart' as _i6;
import '../domain/orders/repository/orders_repository.dart' as _i19;
import '../domain/orders/use_case/add_maal_to_current_order_use_case.dart'
    as _i24;
import '../domain/orders/use_case/add_note_to_current_order_use_case.dart'
    as _i27;
import '../domain/orders/use_case/add_order_use_case.dart' as _i30;
import '../domain/orders/use_case/clear_current_order.dart' as _i28;
import '../domain/orders/use_case/delete_current_order_meal_use_case.dart'
    as _i31;
import '../domain/orders/use_case/delete_order_use_case.dart' as _i32;
import '../domain/orders/use_case/edit_current_order_meal_count_use_case.dart'
    as _i25;
import '../domain/orders/use_case/edit_order_use_case.dart' as _i26;
import '../domain/orders/use_case/get_current_order_use_case.dart' as _i33;
import '../domain/orders/use_case/get_deleted_orders_stream_use_case.dart'
    as _i23;
import '../domain/orders/use_case/get_orders_stream_use_case.dart' as _i29;
import '../presentation/page/create_order/cubit/create_order_cubit.dart'
    as _i42;
import '../presentation/page/dashboard/cubit/dashboard_cubit.dart' as _i41;
import '../presentation/page/home/cubit/home_cubit.dart' as _i7;
import '../presentation/page/meals/cubit/meals_cubit.dart' as _i43;
import '../presentation/page/orders/cubit/orders_cubit.dart' as _i34;
import '../presentation/page/select_meals/cubit/select_meals_cubit.dart'
    as _i40;
import '../presentation/page/statistics/cubit/statistics_cubit.dart' as _i39;
import 'firestore_injectable.dart' as _i44;

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
  gh.factory<_i3.MealToMealDtoMapper>(() => _i3.MealToMealDtoMapper());
  gh.factory<_i4.MealDtoToMealMapper>(() => _i4.MealDtoToMealMapper());
  gh.factory<_i5.GetFreeMealNumberUseCase>(
      () => const _i5.GetFreeMealNumberUseCase());
  gh.factory<_i6.IsMealNumberTakenUseCase>(
      () => const _i6.IsMealNumberTakenUseCase());
  gh.factory<_i7.HomeCubit>(() => _i7.HomeCubit());
  gh.lazySingleton<_i8.MainStreamService>(() => _i9.MainStreamServiceImpl());
  gh.factory<_i10.OrderMealDtoToOrderMealMapper>(
      () => _i10.OrderMealDtoToOrderMealMapper(gh<_i4.MealDtoToMealMapper>()));
  gh.factory<_i11.OrderMealToOrderMealDtoMapper>(
      () => _i11.OrderMealToOrderMealDtoMapper(gh<_i3.MealToMealDtoMapper>()));
  gh.singleton<_i12.FirebaseFirestore>(
    () => firestoreModule.firebaseFirestore,
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.factory<_i13.OrderToOrderDtoMapper>(() =>
      _i13.OrderToOrderDtoMapper(gh<_i11.OrderMealToOrderMealDtoMapper>()));
  gh.factory<_i14.MealsDataSource>(
      () => _i14.MealsDataSource(gh<_i12.FirebaseFirestore>()));
  gh.factory<_i15.OrdersDataSource>(
      () => _i15.OrdersDataSource(gh<_i12.FirebaseFirestore>()));
  gh.factory<_i16.SubscribeMainStreamUseCase>(
      () => _i16.SubscribeMainStreamUseCase(gh<_i8.MainStreamService>()));
  gh.factory<_i17.NotifyMainStreamUseCase>(
      () => _i17.NotifyMainStreamUseCase(gh<_i8.MainStreamService>()));
  gh.factory<_i18.OrderDtoToOrderMapper>(() =>
      _i18.OrderDtoToOrderMapper(gh<_i10.OrderMealDtoToOrderMealMapper>()));
  gh.lazySingleton<_i19.OrdersRepository>(() => _i20.OrdersRepositoryImpl(
        gh<_i15.OrdersDataSource>(),
        gh<_i13.OrderToOrderDtoMapper>(),
        gh<_i8.MainStreamService>(),
        gh<_i18.OrderDtoToOrderMapper>(),
      ));
  gh.lazySingleton<_i21.MealsRepository>(() => _i22.MealsRepositoryImpl(
        gh<_i14.MealsDataSource>(),
        gh<_i3.MealToMealDtoMapper>(),
        gh<_i4.MealDtoToMealMapper>(),
      ));
  gh.factory<_i23.GetDeletedOrdersStreamUseCase>(
      () => _i23.GetDeletedOrdersStreamUseCase(gh<_i19.OrdersRepository>()));
  gh.factory<_i24.AddMealToCurrentOrderUseCase>(
      () => _i24.AddMealToCurrentOrderUseCase(gh<_i19.OrdersRepository>()));
  gh.factory<_i25.EditCurrentOrderMealCountUseCase>(
      () => _i25.EditCurrentOrderMealCountUseCase(gh<_i19.OrdersRepository>()));
  gh.factory<_i26.EditOrderUseCase>(
      () => _i26.EditOrderUseCase(gh<_i19.OrdersRepository>()));
  gh.factory<_i27.AddNoteToCurrentOrderUseCase>(
      () => _i27.AddNoteToCurrentOrderUseCase(gh<_i19.OrdersRepository>()));
  gh.factory<_i28.ClearCurrentOrderUseCase>(
      () => _i28.ClearCurrentOrderUseCase(gh<_i19.OrdersRepository>()));
  gh.factory<_i29.GetOrdersStreamUseCase>(
      () => _i29.GetOrdersStreamUseCase(gh<_i19.OrdersRepository>()));
  gh.factory<_i30.AddOrderUseCase>(
      () => _i30.AddOrderUseCase(gh<_i19.OrdersRepository>()));
  gh.factory<_i31.DeleteCurrentOrderMealUseCase>(
      () => _i31.DeleteCurrentOrderMealUseCase(gh<_i19.OrdersRepository>()));
  gh.factory<_i32.DeleteOrderUseCase>(
      () => _i32.DeleteOrderUseCase(gh<_i19.OrdersRepository>()));
  gh.factory<_i33.GetCurrentOrderUseCase>(
      () => _i33.GetCurrentOrderUseCase(gh<_i19.OrdersRepository>()));
  gh.factory<_i34.OrdersCubit>(() => _i34.OrdersCubit(
        gh<_i29.GetOrdersStreamUseCase>(),
        gh<_i26.EditOrderUseCase>(),
        gh<_i32.DeleteOrderUseCase>(),
      ));
  gh.factory<_i35.GetMealsUseCase>(
      () => _i35.GetMealsUseCase(gh<_i21.MealsRepository>()));
  gh.factory<_i36.DeleteMealUseCase>(
      () => _i36.DeleteMealUseCase(gh<_i21.MealsRepository>()));
  gh.factory<_i37.EditMealUseCase>(
      () => _i37.EditMealUseCase(gh<_i21.MealsRepository>()));
  gh.factory<_i38.AddMealUseCase>(
      () => _i38.AddMealUseCase(gh<_i21.MealsRepository>()));
  gh.factory<_i39.StatisticsCubit>(
      () => _i39.StatisticsCubit(gh<_i23.GetDeletedOrdersStreamUseCase>()));
  gh.factory<_i40.SelectMealsCubit>(() => _i40.SelectMealsCubit(
        gh<_i35.GetMealsUseCase>(),
        gh<_i24.AddMealToCurrentOrderUseCase>(),
        gh<_i33.GetCurrentOrderUseCase>(),
      ));
  gh.factory<_i41.DashboardCubit>(() => _i41.DashboardCubit(
        gh<_i29.GetOrdersStreamUseCase>(),
        gh<_i26.EditOrderUseCase>(),
      ));
  gh.factory<_i42.CreateOrderCubit>(() => _i42.CreateOrderCubit(
        gh<_i33.GetCurrentOrderUseCase>(),
        gh<_i27.AddNoteToCurrentOrderUseCase>(),
        gh<_i16.SubscribeMainStreamUseCase>(),
        gh<_i31.DeleteCurrentOrderMealUseCase>(),
        gh<_i25.EditCurrentOrderMealCountUseCase>(),
        gh<_i30.AddOrderUseCase>(),
        gh<_i28.ClearCurrentOrderUseCase>(),
      ));
  gh.factory<_i43.MealsCubit>(() => _i43.MealsCubit(
        gh<_i38.AddMealUseCase>(),
        gh<_i37.EditMealUseCase>(),
        gh<_i35.GetMealsUseCase>(),
        gh<_i36.DeleteMealUseCase>(),
        gh<_i5.GetFreeMealNumberUseCase>(),
        gh<_i6.IsMealNumberTakenUseCase>(),
      ));
  return getIt;
}

class _$FirestoreModule extends _i44.FirestoreModule {}
