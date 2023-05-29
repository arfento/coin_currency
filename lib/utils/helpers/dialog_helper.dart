import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showExceedInputLimitInfoDialog({
  required BuildContext context,
  required AppLocalizations localization,
}) {
  //todo
  // showDialog(
  //   context: context,
  //   builder: (BuildContext context) => ExceedInputLimitInfoDialog(
  //     localization: localization,
  //   ),
  // );
}

Future showLanguageChangeConfirmationDialog({
  required BuildContext context,
  required AppLocalizations localization,
}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => Container()

      //todo
      //     LanguageChangeConfirmationDialog(
      //   localization: localization,
      // ),
      );
}
