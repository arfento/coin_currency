import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coin_currency/config/services/navigation/service.dart';
import 'package:coin_currency/config/services/shared_preferences/service.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

part 'splash_page_event.dart';
part 'splash_page_state.dart';

class SplashPageBloc extends Bloc<SplashPageEvent, SplashPageState> {
  SharedPreferencesService get _sharedPreferences =>
      GetIt.I.get<SharedPreferencesService>();
  NavigationService get _navigation => GetIt.I.get<NavigationService>();

  SplashPageBloc() : super(SplashPageInitial()) {
    on<SplashPageEvent>((event, emit) {});
    on<SplashPageLoadEvent>(_onBlocLoad);
  }

  FutureOr<void> _onBlocLoad(
      SplashPageLoadEvent event, Emitter<SplashPageState> emit) async {
    emit(SplashPageLoading());

    try {
      bool? _seen = await _sharedPreferences.getIntroPageSeen();
      if (_seen != null) {
        Timer(const Duration(seconds: 3), () {
          _forceHomePage(event.context);
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          _forceIntroPage(event.context);
        });
      }
      Fimber.d(
        'Splash page has been loaded successfully 👍',
      );
      emit(const SplashPageLoaded(true));
    } on Exception catch (e) {
      emit(SplashPageError());
      Fimber.e("Exception during splash page fetching", ex: e);
    }
  }

  _forceIntroPage(context) =>
      _navigation.openIntroPage(context, withReplacement: true);

  _forceHomePage(context) =>
      _navigation.openHomePage(context, withReplacement: true);
}
