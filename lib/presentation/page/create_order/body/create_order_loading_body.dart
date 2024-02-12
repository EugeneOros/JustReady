import 'package:flutter/material.dart';
// import 'package:just_ready/presentation/page/create_order/widgets/create_order_bottom_box.dart';
import 'package:just_ready/presentation/widgets/jr_loader.dart';

class CreateOrderLoadingBody extends StatelessWidget {
  const CreateOrderLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: JrLoader(),
    );

    // Stack(
    //   children: [
    //     Positioned.fill(
    //       child: Center(
    //         child: JrLoader(),
    //       ),
    //     ),
    //     Positioned(
    //       bottom: 0,
    //       right: 0,
    //       left: 0,
    //       child: CreateOrderBottomBox(
    //         order: order,
    //       ),
    //     ),
    //   ],
    // );
  }
}
