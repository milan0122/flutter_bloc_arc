import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_arc_management/bloc/switch_example/switch_bloc.dart';
import 'package:flutter_bloc_arc_management/bloc/switch_example/switch_events.dart';
import 'package:flutter_bloc_arc_management/bloc/switch_example/switch_states.dart';
class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc arch learning"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notification'),

                BlocBuilder<SwitchBloc,SwitchStates>(
                  buildWhen: (previous,current)=>previous.isSwitch != current.isSwitch,
                    builder: (context, state){

                  return  Switch(value: state.isSwitch, onChanged: (newValue){
                    context.read<SwitchBloc>().add(EnableOrDisableNotification());
                  });
                })
              ],
            ),
            SizedBox(height: 50,),
            BlocBuilder<SwitchBloc, SwitchStates>(
                buildWhen: (previous,current)=>previous.slider != current.slider,
                builder: (context,state){
              return Container(
                height: 200,
                color: Colors.blue.withOpacity(state.slider),

              );
            }),
            SizedBox(height: 50,),

            BlocBuilder<SwitchBloc, SwitchStates>(builder: (context, state){
              return Slider(value:state.slider, onChanged: (newValue){
                context.read<SwitchBloc>().add(SliderEvents(newValue: newValue));
                
              });
            })
          ],
        ),
      ),
    );
  }
}
