part of 'splash_page_bloc.dart';

abstract class SplashPageEvent extends Equatable {
  const SplashPageEvent();

  @override
  List<Object> get props => [];
}

class SplashPageLoadEvent extends SplashPageEvent {
  final BuildContext context;

  const SplashPageLoadEvent(this.context);

  @override
  List<Object> get props => [context];
}
