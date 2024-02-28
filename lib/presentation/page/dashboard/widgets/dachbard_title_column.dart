import 'package:flutter/material.dart';
import 'package:just_ready/extensions/build_context_extension.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';

class DashboardTitleColumn extends StatelessWidget {
  final String title;
  const DashboardTitleColumn({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: Dimens.dashboardColumnTitleHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.colors.transparent,
            border: Border(
              right: BorderSide(
                color: context.colors.primary,
                width: Dimens.xxxxs,
              ),
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  Illustrations.banner,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: Dimens.xl),
                  child: Center(
                    child: JrText(
                      title,
                      textAlign: TextAlign.center,
                      style: context.typography.header2,
                      color: context.colors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
