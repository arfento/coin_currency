part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageInitial extends LanguageState {}

class LanguageLoading extends LanguageState {}

class LanguageLoaded extends LanguageState {
  final List<LanguageSelectionModel>? languages;

  const LanguageLoaded(
    this.languages,
  );
  @override
  List<Object> get props => [languages!];
}
