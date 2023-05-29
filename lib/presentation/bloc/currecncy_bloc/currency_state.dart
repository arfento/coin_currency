// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'currency_bloc.dart';

abstract class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object> get props => [];
}

class CurrencyInitial extends CurrencyState {}

class CurrencyError extends CurrencyState {}

class CurrencyLoading extends CurrencyState {}

class CurrencyLoaded extends CurrencyState {
  final List<CurrencyViewModel>? currency;
  const CurrencyLoaded({
    this.currency,
  });

  @override
  List<Object> get props => [currency!];
}
