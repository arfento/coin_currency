import 'package:coin_currency/config/services/navigation/service.dart';
import 'package:coin_currency/config/services/shared_preferences/service.dart';
import 'package:coin_currency/data/datasources/database/hive_service.dart';
import 'package:coin_currency/data/datasources/repositories/server_repository.dart';
import 'package:coin_currency/presentation/providers/app_language_provider.dart';
import 'package:get_it/get_it.dart';

void setupLocator(GetIt getIt) {
  getIt.registerLazySingleton(() => const NavigationService());
  getIt.registerLazySingleton(() => SharedPreferencesService());
  getIt.registerLazySingleton(() => ServerRepository());
  getIt.registerLazySingleton(() => HiveService());
  getIt.registerLazySingleton(
      () => AppLanguageProvider(GetIt.I.get<SharedPreferencesService>()));
}
