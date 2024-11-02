import 'package:flutter/material.dart';
import 'package:flutter_bloc_arc_management/View/counter_screen.dart';
import 'package:flutter_bloc_arc_management/bloc/Counter/counter_bloc.dart';
import 'package:flutter_bloc_arc_management/bloc/switch_example/switch_bloc.dart';
import 'package:flutter_bloc_arc_management/equatable_testing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_arc_management/example2_view/switch_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>SwitchBloc()),
        BlocProvider(create: (_)=>CounterBloc())

      ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: SwitchExample()),
    );
  }
}
