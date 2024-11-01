 import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_arc_management/bloc/Counter/counter_event.dart';
import 'package:flutter_bloc_arc_management/bloc/Counter/counter_state.dart';
// import 'package:meta/meta.dart';
//
//Inherits from Bloc, handling CounterEvent and emitting CounterState. and It listens for the IncrementCounter and DecrementCounter events and updates the state accordingly.
 class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }
  void _increment(IncrementCounter event , Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter +1));
  }
  void _decrement(DecrementCounter event , Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter -1));
  }
}
