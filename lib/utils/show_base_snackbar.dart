import 'package:flutter/material.dart';
import 'package:just_ready/styles/dimens.dart';

void showBaseSnackBar(BuildContext context, {required Widget child}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(Dimens.m),
      content: child,
      margin: const EdgeInsetsDirectional.all(Dimens.s),
    ));
