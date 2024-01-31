import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/router/app_router.dart';
import 'package:just_ready/styles/themes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class JustReadyApp extends StatelessWidget implements ExtensionMixin {
  final String environment;

  const JustReadyApp({
    super.key,
    required this.environment,
  });

  @override
  Widget build(BuildContext context) => MultiProvider(
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
            ],
            routerConfig: AppRouter.router,
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
      );
}
