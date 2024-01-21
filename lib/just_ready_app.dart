import 'package:flutter/material.dart';
import 'package:just_ready/extencions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
// import 'package:just_ready/injectable/injectable.dart';
import 'package:just_ready/presentation/router/app_router.dart';
import 'package:just_ready/styles/themes.dart';
import 'package:just_ready/utils/hide_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class JustReadyApp extends StatelessWidget implements ExtensionMixin {
  final String environment;

  const JustReadyApp({
    super.key,
    required this.environment,
  });

  @override
  Widget build(BuildContext context) => _globalUnfocusKeyboard(
        context: context,
        child: MultiProvider(
          providers: [
            ListenableProvider(create: (_) => ThemeModel()),
            // Provider(create: (context) => getIt<UserSessionCubit>())
          ],
          child: Consumer<ThemeModel>(
            builder: (context, model, child) => MaterialApp.router(
              localizationsDelegates: const [
                Strings.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
              ],
              routerConfig: AppRouter.router,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple.shade800),
                useMaterial3: true,
                extensions: model.currentExtensions,
              ),
            ),
          ),
        ),
      );

  Widget _globalUnfocusKeyboard({
    required BuildContext context,
    required Widget child,
  }) =>
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => hideKeyboard(context),
        child: child,
      );
}
