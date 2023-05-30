import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coin_currency/data/models/language_model/language_selection_model.dart';
import 'package:coin_currency/presentation/providers/app_language_provider.dart';
import 'package:coin_currency/utils/fetch_languages_data_utility.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<LanguageLoadEvent>(_onBlocLoad);
    on<LanguageRefreshEvent>(_onBlocRefresh);
  }

  AppLanguageProvider get langProvider => GetIt.I.get<AppLanguageProvider>();
  final languages = <LanguageSelectionModel>[];

  FutureOr<void> _onBlocLoad(
      LanguageLoadEvent event, Emitter<LanguageState> emit) {
    emit(LanguageLoading());
    languages.clear();
    List<LanguageSelectionModel>? languagesList;

    final languageCode = langProvider.appLocal.languageCode;
    languagesList = FetchLanguagesDataUtility.getLanguages(
      localization: event.localization,
      languageCode: languageCode,
    );

    languages.addAll(languagesList);
    Fimber.d('Languages entity 🚴 $languagesList');
    emit(LanguageLoaded(
      languagesList,
    ));
  }

  FutureOr<void> _onBlocRefresh(
      LanguageRefreshEvent event, Emitter<LanguageState> emit) {
    final languagesList = languages;
    emit(LanguageLoaded(languagesList));
  }

  void selectLanguageItem(
    int index,
    AppLocalizations localization,
    LanguageBloc bloc,
  ) {
    for (var element in languages) {
      element.isSelected = false;
    }
    languages[index].isSelected = true;
  }

  Future<void> changeLanguage(
    int index,
    AppLocalizations localization,
    LanguageBloc bloc,
  ) async {
    final languageCode = languages[index].languageCode;
    await langProvider.changeLanguage(Locale(languageCode));
  }
}
