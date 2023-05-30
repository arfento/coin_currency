import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coin_currency/config/services/navigation/service.dart';
import 'package:coin_currency/config/services/shared_preferences/service.dart';
import 'package:coin_currency/data/models/intro_page_slider_model/intro_page_slider_model.dart';
import 'package:coin_currency/utils/intro_page_slider_data_utility.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

part 'intro_page_event.dart';
part 'intro_page_state.dart';

class IntroPageBloc extends Bloc<IntroPageEvent, IntroPageState> {
  IntroPageBloc() : super(IntroPageInitial()) {
    on<IntroPageEvent>((event, emit) {});
    on<IntroPageLoadEvent>(_onBlocLoad);
  }

  SharedPreferencesService get _sharedPreferences =>
      GetIt.I.get<SharedPreferencesService>();
  NavigationService get _navigation => GetIt.I.get<NavigationService>();
  final PageController pageController = PageController(initialPage: 0);
  final _pageIndexStream = BehaviorSubject.seeded(1);
  int currentPage = 0;
  final sliders = <IntroPageSliderModel>[];
  onPageControllerChange(int _index) => _pageIndexStream.add(_index);

  FutureOr<void> _onBlocLoad(
      IntroPageLoadEvent event, Emitter<IntroPageState> emit) {
    emit(IntroPageLoading());
    List<IntroPageSliderModel>? sliderList;

    sliderList = IntroPageSliderDataUtility.getSliderItems(event.localizations);
    sliders.addAll(sliderList);

    onPageControllerChange(0);
    Fimber.d('Sliders entity has been loaded successfully 🔄');
    pageController.addListener(() => onPageControllerChange(currentPage));
    emit(IntroPageLoaded(sliderList));
  }

  void onPageChanged(int index) {
    currentPage = index;
  }

  void openHomePage(BuildContext context) {
    _setIntroPageSeen(context);
    _navigation.openHomePage(context);
  }

  void _setIntroPageSeen(BuildContext context) {
    _sharedPreferences.setIntroPageSeen();
  }

  @override
  Future<void> close() {
    _pageIndexStream.close();
    pageController.dispose();
    return super.close();
  }
}

extension IntroPageSliderBlocRxExtension on IntroPageBloc {
  Stream<int> get pageIndexStream => _pageIndexStream.stream;
  int get pageIndexValue => _pageIndexStream.value;
}
