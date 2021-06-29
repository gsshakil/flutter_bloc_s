import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_study/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_study/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_study/presentation/screens/second_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => BlocProvider.value(
                value: _counterCubit,
                child:
                    HomeScreen(title: 'Home Screeen', color: Colors.blueAccent),
              ),
          '/second': (context) => BlocProvider.value(
                value: _counterCubit,
                child: SecondScreen(
                    title: 'Second Screeen', color: Colors.redAccent),
              ),
          '/third': (context) => BlocProvider.value(
                value: _counterCubit,
                child: SecondScreen(
                    title: 'Second Screeen', color: Colors.redAccent),
              ),
        },
      ),
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
