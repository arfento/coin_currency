import 'package:coin_currency/presentation/pages/calculator_page.dart';
import 'package:coin_currency/presentation/pages/currency_history_page.dart';
import 'package:coin_currency/presentation/pages/languages_page.dart';

class HomeNavPagesDataUtility {
  static List getNavPages() {
    final _pages = [
      const CalculatorPage(),
      const CurrencyHistoryPage(),
      const LanguagesPage()
    ];
    return _pages;
  }
}
