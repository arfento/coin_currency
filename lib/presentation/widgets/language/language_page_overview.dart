// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:coin_currency/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:coin_currency/presentation/widgets/language/language_page_item.dart';

class LanguagePageOverview extends StatelessWidget {
  final LanguageBloc languageBloc;
  final AppLocalizations localization;
  const LanguagePageOverview({
    Key? key,
    required this.languageBloc,
    required this.localization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
            itemCount: languageBloc.languages.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var data = languageBloc.languages[index];
              return LanguagePageItem(
                  languageBloc: languageBloc,
                  localization: localization,
                  langObject: data,
                  index: index);
            }));
  }
}
