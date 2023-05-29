import 'package:coin_currency/data/models/currency_model/currency_view_model.dart';

class FetchDefaultConversionItem {
  static CurrencyViewModel fetchItem() {
    return CurrencyViewModel(
        code: 'AZN', value: 1.0, name: 'Azərbaycan Manatı', nominal: 1);
  }
}
