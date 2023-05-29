part of 'intro_page_bloc.dart';

abstract class IntroPageEvent extends Equatable {
  const IntroPageEvent();

  @override
  List<Object> get props => [];
}

class IntroPageLoadEvent extends IntroPageEvent {
  final AppLocalizations localizations;

  const IntroPageLoadEvent(this.localizations);

  @override
  List<Object> get props => [localizations];
}
