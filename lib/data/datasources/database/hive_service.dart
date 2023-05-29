import 'package:coin_currency/data/models/currency_model/currency_history_model.dart';
import 'package:coin_currency/data/models/currency_model/currency_view_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveService {
  late Box currencyViewBox;
  late Box currencyHistoryViewBox;

  Future<void> initHiveService() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    final appDocumentPath = appDocumentDirectory.path;

    Hive.init(appDocumentPath);

    Hive.registerAdapter(CurrencyViewModelAdapter());

    Hive.registerAdapter(CurrencyHistoryModelAdapter());

    currencyViewBox = await Hive.openBox('currency_view_box');

    currencyHistoryViewBox = await Hive.openBox('currency_history_box');
  }

  Future<void> storeCachedCurrenciesWithDate(
          String date, List<CurrencyViewModel?>? value) async =>
      await currencyViewBox.put(date, value);

  Future<void> storeCurrenciesToHistoryWithKey(
          List<CurrencyHistoryModel?>? value) async =>
      await currencyHistoryViewBox.put('history', value);

  fetchCachedCurrenciesWithDate(String date) =>
      currencyViewBox.get(date, defaultValue: <CurrencyViewModel>[]);

  fetchCurrenciesHistoryWithKey() => currencyHistoryViewBox
      .get('history', defaultValue: <CurrencyHistoryModel>[]);

  bool checkDateIsCached(String date) => currencyViewBox.containsKey(date);

  bool checkHistoryIsNotEmpty() =>
      currencyHistoryViewBox.containsKey('history');

  void close() {
    Hive.close();
  }
}
