import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_arc_management/bloc/switch_example/switch_events.dart';
import 'package:flutter_bloc_arc_management/bloc/switch_example/switch_states.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {
  //super requires initial state which is switchStates
  SwitchBloc() : super(SwitchStates()) {
   on<EnableOrDisableNotification>(_enableDisableNotification);
   on<SliderEvents>(_sliderChange);

  }
  void _enableDisableNotification(EnableOrDisableNotification events, Emitter<SwitchStates>emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
  void _sliderChange(SliderEvents events, Emitter<SwitchStates>emit){
    emit(state.copyWith(slider: events.newValue));
  }
}
