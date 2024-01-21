import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_ready/presentation/page/add_orders/cubit/add_orders_state.dart';

@injectable
class AddOrdersCubit extends Cubit<AddOrdersState> {
  // final GetEventInfoListUseCase getEventInfoListUseCase;

  AddOrdersCubit(
      // this.getEventInfoListUseCase,
      )
      : super(const AddOrdersState.loading());
}
