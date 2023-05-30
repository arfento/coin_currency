import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculator_page_event.dart';
part 'calculator_page_state.dart';

class CalculatorPageBloc extends Bloc<CalculatorPageEvent, CalculatorPageState> {
  CalculatorPageBloc() : super(CalculatorPageInitial()) {
    on<CalculatorPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
