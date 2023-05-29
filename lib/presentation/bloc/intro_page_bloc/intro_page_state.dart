part of 'intro_page_bloc.dart';

abstract class IntroPageState extends Equatable {
  const IntroPageState();

  @override
  List<Object> get props => [];
}

class IntroPageInitial extends IntroPageState {}

class IntroPageLoading extends IntroPageState {}

class IntroPageError extends IntroPageState {}

class IntroPageLoaded extends IntroPageState {
  final List<IntroPageSliderModel>? sliderList;

  const IntroPageLoaded(this.sliderList);

  @override
  List<Object> get props => [sliderList!];
}
