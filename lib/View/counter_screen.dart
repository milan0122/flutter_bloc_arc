import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_arc_management/bloc/Counter/counter_bloc.dart';
import 'package:flutter_bloc_arc_management/bloc/Counter/counter_event.dart';
import 'package:flutter_bloc_arc_management/bloc/Counter/counter_state.dart';
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Bloc arch learning')
    ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(child: Text('Counter Examples',style: TextStyle(fontSize: 30),)),
          SizedBox(height: 60,),

          //BlocBuilder to listen for changes in CounterState from CounterBloc.
          BlocBuilder<CounterBloc,CounterState>(builder: (BuildContext context, state){
            return Center(child: Text(state.counter.toString(),style: TextStyle(fontSize: 60),));
          }),

          SizedBox(height: 60,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            ElevatedButton(onPressed: (){
              context.read<CounterBloc>().add(IncrementCounter());
            }, child: Text('Increment')),
            SizedBox(width: 20,),
            ElevatedButton(onPressed: (){
              context.read<CounterBloc>().add(DecrementCounter());
            }, child: Text('Decrement'))
          ],)
        ],
      ),
    );
  }
}
