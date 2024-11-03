import 'package:flutter/material.dart';
import 'package:flutter_bloc_arc_management/Repo/fav_repo.dart';
import 'package:flutter_bloc_arc_management/View/Favourite_app/fav_view.dart';
import 'package:flutter_bloc_arc_management/View/counter_screen.dart';
import 'package:flutter_bloc_arc_management/View/example2_view/switch_example.dart';
import 'package:flutter_bloc_arc_management/bloc/Counter/counter_bloc.dart';
import 'package:flutter_bloc_arc_management/bloc/favourite/fav_bloc.dart';
import 'package:flutter_bloc_arc_management/bloc/switch_example/switch_bloc.dart';
import 'package:flutter_bloc_arc_management/equatable_testing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
        BlocProvider(create: (_)=>CounterBloc()),
        BlocProvider(create: (_)=>FavBloc(FavRepo()))

      ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const FavView()),
    );
  }
}
