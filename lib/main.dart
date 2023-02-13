import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_size/window_size.dart';

import 'constants/color_schemes.dart';
import 'utils/go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle("TripFlut");
  }

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const ProviderScope(
        child: MainApp(),
      ), // Wrap your app
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) =>
          MaterialApp.router(
        title: 'TripFlut',
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        routerConfig: goRouter,
        theme: ThemeData.from(
          colorScheme: lightDynamic ?? lightColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData.from(
          colorScheme: darkDynamic ?? darkColorScheme,
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        localeListResolutionCallback: (locales, supportedLocales) {
          if (locales == null || locales.isEmpty) {
            return const Locale('en');
          }

          for (var locale in locales) {
            if (locale.languageCode == 'zh') {
              if (locale.scriptCode == 'Hant') {
                return const Locale('zh', 'TW');
              } else if (locale.scriptCode == 'Hans') {
                return const Locale('zh');
              } else if (locale.countryCode == 'TW' ||
                  locale.countryCode == 'HK') {
                return const Locale('zh', 'TW');
              } else {
                return const Locale('zh');
              }
            }
          }

          return const Locale('en');
        },
      ),
    );
  }
}
