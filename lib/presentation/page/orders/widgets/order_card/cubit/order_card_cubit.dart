import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/presentation/page/orders/widgets/order_card/cubit/order_card_state.dart';

const deletionContdownInitValue = 5;

@injectable
class OrderCardCubit extends Cubit<OrderCardState> {
  Timer? timer;
  int deletionCountdown = deletionContdownInitValue;

  OrderCardCubit()
      : super(
          const OrderCardState.loaded(
            showCountdown: false,
            countdown: deletionContdownInitValue,
          ),
        );

  void startCountdown() {
    emit(const OrderCardState.idle());
    emit(OrderCardState.loaded(showCountdown: true, countdown: deletionCountdown));
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      if (deletionCountdown < 1) {
        cancelCountdown();
        emit(const OrderCardState.deleteOrder());
      } else {
        deletionCountdown--;
        emit(OrderCardState.loaded(showCountdown: true, countdown: deletionCountdown));
      }
    });
  }

  void cancelCountdown() {
    if (timer == null) return;
    emit(const OrderCardState.idle());
    timer!.cancel();
    deletionCountdown = deletionContdownInitValue;
    emit(OrderCardState.loaded(showCountdown: false, countdown: deletionCountdown));
  }
}
