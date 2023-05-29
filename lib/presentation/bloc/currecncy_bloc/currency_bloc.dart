import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coin_currency/data/datasources/database/hive_service.dart';
import 'package:coin_currency/data/datasources/repositories/server_repository.dart';
import 'package:coin_currency/data/models/currency_model/currency_view_model.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(CurrencyInitial()) {
    on<CurrencyEvent>((event, emit) {});
    on<CurrencyLoadEvent>(_onBlocLoad);
  }

  HiveService get _hiveService => GetIt.I.get<HiveService>();
  ServerRepository get serverRepository => GetIt.I.get<ServerRepository>();

  String get currentDate => DateFormat('dd.MM.yyyy').format(selectedDateValue);
  String get formattedDate =>
      DateFormat('MMMM dd, yyyy').format(selectedDateValue);

  final currencies = <CurrencyViewModel>[];
  final currenciesHistory = <CurrencyViewModel>[];
  CurrencyViewModel currencyModel = CurrencyViewModel();

  static const maxValueLimit = 999999;

  /// RxDart Stream Controllers
  final _fromConversionValueIndicatorController =
      BehaviorSubject<CurrencyViewModel>();
  final _toConversionValueIndicatorController =
      BehaviorSubject<CurrencyViewModel>();
  final _typedConversionValueController = BehaviorSubject<double>.seeded(0);
  final _conversionValueController = BehaviorSubject<double>.seeded(0);
  final _selectedDateController =
      BehaviorSubject<DateTime>.seeded(DateTime.now());

  ///
  Future<FutureOr<void>> _onBlocLoad(
      CurrencyLoadEvent event, Emitter<CurrencyState> emit) async {
    emit(CurrencyLoading());
    _clearCurrencies();

    try {
      if (_hiveService.checkHistoryIsNotEmpty()) {
        final cachedCurrenciesData =
            _hiveService.fetchCurrenciesHistoryWithKey();
        cachedCurrenciesData.forEach(currenciesHistory.add);
        // for (var element in cachedCurrenciesData) {
        //   currenciesHistory.add(element);

        // }
      }
      if (_hiveService.checkDateIsCached(currentDate)) {
        final cachedCurrenciesData =
            _hiveService.fetchCachedCurrenciesWithDate(currentDate);

        cachedCurrenciesData.forEach(currencies.add);
      } else {
        final response = await serverRepository.getCurrencies(currentDate);
        await _hiveService.storeCachedCurrenciesWithDate(currentDate, response);
        currencies.addAll(response);
      }

      _addDefaultValuesToControllers();

      _checkEmittingState(currencies, emit);
    } on Exception catch (e) {
      emit(CurrencyError());
      Fimber.e("Exception during currency details fetching 😥", ex: e);
    }
  }

  void _clearCurrencies() {
    currencies.clear();
  }

  void _addDefaultValuesToControllers() {
    _fromConversionValueIndicatorController.add(currencies.elementAt(0));
    _toConversionValueIndicatorController.add(currencies.elementAt(1));
    _typedConversionValueController.add(1);
    _conversionValueController
        .add(currencies.elementAt(1).value! * typedConversionValue);
  }

  void _checkEmittingState(List<CurrencyViewModel> _currencies, emit) {
    if (currencies.isEmpty) {
      emit(CurrencyError());
      Fimber.e('Cannot fetch currency details 😥');
      return;
    }
    Fimber.d('Currency details has been fetched successfully 💱');

    emit(CurrencyLoaded(
      currency: currencies,
    ));
  }

  @override
  Future<void> close() {
    _fromConversionValueIndicatorController.close();
    _toConversionValueIndicatorController.close();
    _typedConversionValueController.close();
    _conversionValueController.close();
    _hiveService.close();
    _selectedDateController.close();
    return super.close();
  }
}

extension CurrencyBlocSelectedDateControllerRxExtension on CurrencyBloc {
  DateTime get selectedDateValue => _selectedDateController.value;
}

extension CurrencyBlocFromConversionValueIndicatorControllerRxExtension
    on CurrencyBloc {
  Stream<CurrencyViewModel> get fromConversionStream =>
      _fromConversionValueIndicatorController.stream;
  CurrencyViewModel get fromConversionValue =>
      _fromConversionValueIndicatorController.value;
}

extension CurrencyBlocToConversionValueIndicatorControllerRxExtension
    on CurrencyBloc {
  Stream<CurrencyViewModel> get toConversionStream =>
      _toConversionValueIndicatorController.stream;
  CurrencyViewModel get toConversionValue =>
      _toConversionValueIndicatorController.value;
}

extension CurrencyBlocTypedConversionValueControllerRxExtension
    on CurrencyBloc {
  Stream<double> get typedConversionStream =>
      _typedConversionValueController.stream;
  double get typedConversionValue => _typedConversionValueController.value;
}

extension CurrencyBlocConversionValueControllerRxExtension on CurrencyBloc {
  Stream<double> get conversionStream => _conversionValueController.stream;
  double get conversionValue => _conversionValueController.value;
}
