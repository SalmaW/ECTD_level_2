import 'package:ectd2/day008/bloc/employee_bloc.dart';
import 'package:ectd2/day008/cubit/emp_cubit.dart';
import 'package:ectd2/day008/repository/emp_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../day008/pages/home.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => EmpCubit(),
        ),
        BlocProvider<EmployeeBloc>(
          create: (BuildContext context) => EmployeeBloc(EmpRepo()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      title: 'Bloc',
      home: const Home(),
    );
  }
}
