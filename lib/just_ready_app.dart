import 'package:flutter/material.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/injectable/injectable.dart';
import 'package:just_ready/presentation/router/app_router.dart';
import 'package:just_ready/styles/themes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class JustReadyApp extends StatelessWidget implements ExtensionMixin {
  final String environment;

  JustReadyApp({
    super.key,
    required this.environment,
  });

  late final _router = AppRouter();

  @override
  Widget build(BuildContext context) => HookedBlocConfigProvider(
        injector: () => getIt.get,
        builderCondition: (state) => state != null,
        listenerCondition: (state) => state != null,
        child: MultiProvider(
          providers: [
            ListenableProvider(create: (_) => ThemeModel()..setTheme = ThemeType.light),
            // Provider(create: (context) => getIt<UserSessionCubit>())
          ],
          child: Consumer<ThemeModel>(
            builder: (context, model, child) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                Strings.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('pl'),
                // Locale('en'),
              ],
              routerConfig: _router.router,
              theme: ThemeData(
                textSelectionTheme: TextSelectionThemeData(
                  cursorColor: context.colors.primary,
                  selectionColor: context.colors.primary,
                ),
                colorScheme: ColorScheme.fromSeed(seedColor: context.colors.primary),
                useMaterial3: true,
                extensions: model.currentExtensions,
              ),
            ),
          ),
        ),
      );
}
