// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/main_stream/service/main_stream_service_impl.dart' as _i8;
import '../data/meals/data_source/meal_data_source.dart' as _i11;
import '../data/meals/mapper/meal_dto_to_meal_mapper.dart' as _i9;
import '../data/meals/mapper/meal_to_meal_dto_mapper.dart' as _i10;
import '../data/meals/repository/meals_repository_impl.dart' as _i13;
import '../data/orders/data_source/orders_data_source.dart' as _i19;
import '../data/orders/mapper/order_dto_to_order_mapper.dart' as _i26;
import '../data/orders/mapper/order_meal_dto_to_order_meal_mapper.dart' as _i16;
import '../data/orders/mapper/order_meal_to_order_meal_dto_mapper.dart' as _i17;
import '../data/orders/mapper/order_to_order_dto_mapper.dart' as _i18;
import '../data/orders/repository/order_repository_impl.dart' as _i28;
import '../domain/main_stream/service/main_stream_service.dart' as _i7;
import '../domain/main_stream/usecase/notify_main_stream_use_case.dart' as _i14;
import '../domain/main_stream/usecase/subscribe_main_stream_use_case.dart'
    as _i20;
import '../domain/meals/meals_repository.dart' as _i12;
import '../domain/meals/use_case/add_meal_use_case.dart' as _i21;
import '../domain/meals/use_case/delete_meal_use_case.dart' as _i22;
import '../domain/meals/use_case/edit_meal_use_case.dart' as _i23;
import '../domain/meals/use_case/get_free_meal_number_use_case.dart' as _i4;
import '../domain/meals/use_case/get_meals_use_case.dart' as _i24;
import '../domain/meals/use_case/is_meal_number_taken_use_case.dart' as _i6;
import '../domain/orders/repository/orders_repository.dart' as _i27;
import '../domain/orders/use_case/add_maal_to_current_order_use_case.dart'
    as _i29;
import '../domain/orders/use_case/add_note_to_current_order_use_case.dart'
    as _i30;
import '../domain/orders/use_case/add_order_use_case.dart' as _i31;
import '../domain/orders/use_case/clear_current_order.dart' as _i32;
import '../domain/orders/use_case/delete_current_order_meal_use_case.dart'
    as _i33;
import '../domain/orders/use_case/delete_order_use_case.dart' as _i34;
import '../domain/orders/use_case/edit_current_order_meal_count_use_case.dart'
    as _i35;
import '../domain/orders/use_case/edit_order_use_case.dart' as _i36;
import '../domain/orders/use_case/get_current_order_use_case.dart' as _i37;
import '../domain/orders/use_case/get_orders_stream_use_case.dart' as _i38;
import '../presentation/page/create_order/cubit/create_order_cubit.dart'
    as _i41;
import '../presentation/page/home/cubit/home_cubit.dart' as _i5;
import '../presentation/page/meals/cubit/meals_cubit.dart' as _i25;
import '../presentation/page/orders/cubit/orders_cubit.dart' as _i39;
import '../presentation/page/orders/widgets/order_card/cubit/order_card_cubit.dart'
    as _i15;
import '../presentation/page/select_meals/cubit/select_meals_cubit.dart'
    as _i40;
import 'firestore_injectable.dart' as _i42;

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
  gh.singleton<_i3.FirebaseFirestore>(
    firestoreModule.firebaseFirestore,
    registerFor: {
      _dev,
      _prod,
      _test,
    },
  );
  gh.factory<_i4.GetFreeMealNumberUseCase>(
      () => const _i4.GetFreeMealNumberUseCase());
  gh.factory<_i5.HomeCubit>(() => _i5.HomeCubit());
  gh.factory<_i6.IsMealNumberTakenUseCase>(
      () => const _i6.IsMealNumberTakenUseCase());
  gh.lazySingleton<_i7.MainStreamService>(() => _i8.MainStreamServiceImpl());
  gh.factory<_i9.MealDtoToMealMapper>(() => _i9.MealDtoToMealMapper());
  gh.factory<_i10.MealToMealDtoMapper>(() => _i10.MealToMealDtoMapper());
  gh.factory<_i11.MealsDataSource>(
      () => _i11.MealsDataSource(gh<_i3.FirebaseFirestore>()));
  gh.lazySingleton<_i12.MealsRepository>(() => _i13.MealsRepositoryImpl(
        gh<_i11.MealsDataSource>(),
        gh<_i10.MealToMealDtoMapper>(),
        gh<_i9.MealDtoToMealMapper>(),
      ));
  gh.factory<_i14.NotifyMainStreamUseCase>(
      () => _i14.NotifyMainStreamUseCase(gh<_i7.MainStreamService>()));
  gh.factory<_i15.OrderCardCubit>(() => _i15.OrderCardCubit());
  gh.factory<_i16.OrderMealDtoToOrderMealMapper>(
      () => _i16.OrderMealDtoToOrderMealMapper(gh<_i9.MealDtoToMealMapper>()));
  gh.factory<_i17.OrderMealToOrderMealDtoMapper>(
      () => _i17.OrderMealToOrderMealDtoMapper(gh<_i10.MealToMealDtoMapper>()));
  gh.factory<_i18.OrderToOrderDtoMapper>(() =>
      _i18.OrderToOrderDtoMapper(gh<_i17.OrderMealToOrderMealDtoMapper>()));
  gh.factory<_i19.OrdersDataSource>(
      () => _i19.OrdersDataSource(gh<_i3.FirebaseFirestore>()));
  gh.factory<_i20.SubscribeMainStreamUseCase>(
      () => _i20.SubscribeMainStreamUseCase(gh<_i7.MainStreamService>()));
  gh.factory<_i21.AddMealUseCase>(
      () => _i21.AddMealUseCase(gh<_i12.MealsRepository>()));
  gh.factory<_i22.DeleteMealUseCase>(
      () => _i22.DeleteMealUseCase(gh<_i12.MealsRepository>()));
  gh.factory<_i23.EditMealUseCase>(
      () => _i23.EditMealUseCase(gh<_i12.MealsRepository>()));
  gh.factory<_i24.GetMealsUseCase>(
      () => _i24.GetMealsUseCase(gh<_i12.MealsRepository>()));
  gh.factory<_i25.MealsCubit>(() => _i25.MealsCubit(
        gh<_i21.AddMealUseCase>(),
        gh<_i23.EditMealUseCase>(),
        gh<_i24.GetMealsUseCase>(),
        gh<_i22.DeleteMealUseCase>(),
        gh<_i4.GetFreeMealNumberUseCase>(),
        gh<_i6.IsMealNumberTakenUseCase>(),
      ));
  gh.factory<_i26.OrderDtoToOrderMapper>(() =>
      _i26.OrderDtoToOrderMapper(gh<_i16.OrderMealDtoToOrderMealMapper>()));
  gh.lazySingleton<_i27.OrdersRepository>(() => _i28.OrdersRepositoryImpl(
        gh<_i19.OrdersDataSource>(),
        gh<_i18.OrderToOrderDtoMapper>(),
        gh<_i7.MainStreamService>(),
        gh<_i26.OrderDtoToOrderMapper>(),
      ));
  gh.factory<_i29.AddMealToCurrentOrderUseCase>(
      () => _i29.AddMealToCurrentOrderUseCase(gh<_i27.OrdersRepository>()));
  gh.factory<_i30.AddNoteToCurrentOrderUseCase>(
      () => _i30.AddNoteToCurrentOrderUseCase(gh<_i27.OrdersRepository>()));
  gh.factory<_i31.AddOrderUseCase>(
      () => _i31.AddOrderUseCase(gh<_i27.OrdersRepository>()));
  gh.factory<_i32.ClearCurrentOrderUseCase>(
      () => _i32.ClearCurrentOrderUseCase(gh<_i27.OrdersRepository>()));
  gh.factory<_i33.DeleteCurrentOrderMealUseCase>(
      () => _i33.DeleteCurrentOrderMealUseCase(gh<_i27.OrdersRepository>()));
  gh.factory<_i34.DeleteOrderUseCase>(
      () => _i34.DeleteOrderUseCase(gh<_i27.OrdersRepository>()));
  gh.factory<_i35.EditCurrentOrderMealCountUseCase>(
      () => _i35.EditCurrentOrderMealCountUseCase(gh<_i27.OrdersRepository>()));
  gh.factory<_i36.EditOrderUseCase>(
      () => _i36.EditOrderUseCase(gh<_i27.OrdersRepository>()));
  gh.factory<_i37.GetCurrentOrderUseCase>(
      () => _i37.GetCurrentOrderUseCase(gh<_i27.OrdersRepository>()));
  gh.factory<_i38.GetOrdersStreamUseCase>(
      () => _i38.GetOrdersStreamUseCase(gh<_i27.OrdersRepository>()));
  gh.factory<_i39.OrdersCubit>(() => _i39.OrdersCubit(
        gh<_i38.GetOrdersStreamUseCase>(),
        gh<_i36.EditOrderUseCase>(),
        gh<_i34.DeleteOrderUseCase>(),
      ));
  gh.factory<_i40.SelectMealsCubit>(() => _i40.SelectMealsCubit(
        gh<_i24.GetMealsUseCase>(),
        gh<_i29.AddMealToCurrentOrderUseCase>(),
      ));
  gh.factory<_i41.CreateOrderCubit>(() => _i41.CreateOrderCubit(
        gh<_i37.GetCurrentOrderUseCase>(),
        gh<_i30.AddNoteToCurrentOrderUseCase>(),
        gh<_i20.SubscribeMainStreamUseCase>(),
        gh<_i33.DeleteCurrentOrderMealUseCase>(),
        gh<_i35.EditCurrentOrderMealCountUseCase>(),
        gh<_i31.AddOrderUseCase>(),
        gh<_i32.ClearCurrentOrderUseCase>(),
      ));
  return getIt;
}

class _$FirestoreModule extends _i42.FirestoreModule {}
