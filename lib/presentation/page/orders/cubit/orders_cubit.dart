import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_ready/presentation/page/orders/cubit/orders_state.dart';

@injectable
class OrdersCubit extends Cubit<OrdersState> {
  // final GetEventInfoListUseCase getEventInfoListUseCase;

  OrdersCubit(
      // this.getEventInfoListUseCase,
      )
      : super(const OrdersState.loading());
}
