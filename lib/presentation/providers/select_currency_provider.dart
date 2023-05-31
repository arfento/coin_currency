import 'dart:async';

import 'package:coin_currency/config/services/navigation/service.dart';
import 'package:coin_currency/data/models/currency_model/currency_selection_model.dart';
import 'package:coin_currency/data/models/currency_model/currency_view_model.dart';
import 'package:coin_currency/presentation/bloc/currecncy_bloc/currency_bloc.dart';
import 'package:coin_currency/utils/fetch_currencies_for_conversion_modal.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectCurrencyProvider with ChangeNotifier {
  /// Auto Initialize Populating Currencies List
  SelectCurrencyProvider(currencies, selectedCurrencyName, localization) {
    getCurrencies(currencies, selectedCurrencyName, localization);
  }
  NavigationService get _navigation => GetIt.I.get<NavigationService>();

  List<CurrencySelectionModel> currenciesList = <CurrencySelectionModel>[];

  /// Fethcing Currencies List
  void getCurrencies(
    List<CurrencyViewModel> currencies,
    String? selectedCurrencyName,
    AppLocalizations localization,
  ) {
    currenciesList = FetchCurrenciesForConversionModal.fetchCurrencies(
      currencies,
      localization,
      selectedCurrencyName,
    );

    notifyListeners();
  }

  void selectCurrencyItem(int index, bool toConversion,
      CurrencyBloc currencyBloc, BuildContext context) {
    _makeCurrencyItemSelected(index);
    Timer(
        (const Duration(milliseconds: 115)),
        () => _refreshCurrentCurrencyValue(
            toConversion, context, currencyBloc, index));
    notifyListeners();
  }

  void _refreshCurrentCurrencyValue(bool toConversion, BuildContext context,
      CurrencyBloc currencyBloc, int index) {
    if (toConversion) {
      currencyBloc.refreshToConversionValueWithIndex(index);
    } else {
      currencyBloc.refreshFromConversionValueWithIndex(index);
    }
    _comeBack(context);
  }

  void _comeBack(context) => _navigation.back(context);

  void _makeCurrencyItemSelected(index) {
    for (var element in currenciesList) {
      element.isSelected = false;
    }
    currenciesList[index].isSelected = true;
  }
}
