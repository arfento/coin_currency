part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class LanguageLoadEvent extends LanguageEvent {
  final AppLocalizations localization;
  const LanguageLoadEvent(this.localization);

  @override
  List<Object> get props => [localization];
}

class LanguageRefreshEvent extends LanguageEvent {}
