import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:threemodel/cubit/changecontroller/changecontroller_cubit.dart';
import 'package:threemodel/cubit/changepage/changepage_cubit.dart';
import 'package:threemodel/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChangepageCubit(),
        ),
        BlocProvider(
          create: (context) => ChangecontrollerCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter 3D Controller',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
