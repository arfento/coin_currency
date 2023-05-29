import 'dart:async';
import 'dart:io';

import 'package:coin_currency/config/constants/colors.dart';
import 'package:coin_currency/config/services/get_it/service.dart';
import 'package:coin_currency/config/services/navigation/routes.dart';
import 'package:coin_currency/config/services/navigation/service.dart';
import 'package:coin_currency/data/datasources/database/hive_service.dart';
import 'package:coin_currency/presentation/providers/app_language_provider.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    if (kDebugMode) {
      Fimber.plantTree(DebugTree());
    }

    GetIt getIt = GetIt.instance;
    setupLocator(getIt);
    GetIt.I.get<HiveService>().initHiveService();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparentColor,
    ));
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
        .then((_) {
      runApp(
        ChangeNotifierProvider(
            create: (_) => getIt.get<AppLanguageProvider>(),
            child: const MyApp()),
      );
    });
  }, (error, stackTrace) {
    if (error is SocketException) {
      Fimber.e('Socket exception occurred 😥');
    }
    Fimber.e('Error in main thread appeared. 😥',
        ex: error, stacktrace: stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppLanguageProvider>(builder: (context, lang, child) {
      return Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Coin Currency',
          navigatorKey: NavigationService.navigationKey,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          locale: lang.appLocal,
          initialRoute: NavigationRoutes.splash,
          onGenerateRoute: generateRoute,
        );
      });
    });
  }
}
