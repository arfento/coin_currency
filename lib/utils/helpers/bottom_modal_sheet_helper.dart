import 'package:coin_currency/config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showFromCurrencyBottomModal(
  context,
  AppLocalizations localization,
  // CurrencyBloc currencyBloc,
  String? selectedCurrencyName, {
  required bool toConversionBoolean,
}) {
  showModalBottomSheet(
    backgroundColor: AppColors.whiteColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      //todo
      return Container();
      // SelectCurrencyModal(
      //     selectedCurrencyName: selectedCurrencyName,
      //     localization: localization,
      //     toConversion: toConversionBoolean,
      //     currencyBloc: currencyBloc);
    },
  );
}
