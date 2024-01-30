import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/config/firebase_options.dart';
import 'package:just_ready/injectable/injectable.dart';
import 'package:just_ready/just_ready_app.dart';
import 'package:just_ready/utils/logger.dart';

const String _environmentDefineKey = 'ENVIRONMENT';
const String _prodEnvironmentFullName = 'production';

const _supportedEnvironments = [
  Environment.prod,
  Environment.dev,
];

Future<void>? main() => runMobileApp(_getEnvironment());

Future<void>? runMobileApp(final String environment) => runZonedGuarded<Future<void>>(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        // Bloc.observer = CustomBlocObserver();
        await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
        if (!_supportedEnvironments.contains(environment)) {
          throw ArgumentError('Environment $environment is not supported');
        }
        // if (environment != Environment.test && environment != Environment.prod) {
        //   Fimber.plantTree(DebugTree(useColors: true));
        // }
        if (kIsWeb) configureDependencies(environment);
        runApp(
          HookedBlocConfigProvider(
            injector: () => getIt.get,
            builderCondition: (state) => state != null,
            listenerCondition: (state) => state != null,
            child: JustReadyApp(environment: environment),
          ),
        );
      },
      (err, st) {
        logger.e(err);
      },
    );

String _getEnvironment() {
  const baseEnvironment = String.fromEnvironment(_environmentDefineKey, defaultValue: Environment.prod);
  return baseEnvironment == _prodEnvironmentFullName ? Environment.prod : baseEnvironment;
}
