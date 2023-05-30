import 'package:coin_currency/presentation/widgets/dialogs/exceed_input_limit_info_dialog.dart';
import 'package:coin_currency/presentation/widgets/dialogs/language_change_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showExceedInputLimitInfoDialog({
  required BuildContext context,
  required AppLocalizations localization,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => ExceedInputLimitInfoDialog(
      localization: localization,
    ),
  );
}

Future showLanguageChangeConfirmationDialog({
  required BuildContext context,
  required AppLocalizations localization,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => LanguageChangeConfirmationDialog(
      localization: localization,
    ),
  );
}
