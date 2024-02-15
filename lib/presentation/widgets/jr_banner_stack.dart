import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';

class JrBannerStack extends StatelessWidget {
  final String? illustration;
  final Widget child;

  const JrBannerStack({
    super.key,
    this.illustration,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Column(
            children: [
              Container(
                color: context.colors.primary,
                height: Dimens.bannerHeight,
                width: double.infinity,
                child: Image.asset(
                  illustration ?? Illustrations.banner,
                  fit: BoxFit.cover,
                ),
              ),
              // Container(
              //   color: context.colors.primary,
              //   height: Dimens.l,
              // )
            ],
          ),
        ),
        child,
      ],
    );
}
