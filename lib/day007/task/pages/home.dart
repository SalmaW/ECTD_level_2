import 'package:ectd2/day007/task/bloc/employee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<EmployeeBloc>().add(LoadEmployeeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Bloc'),
      ),
      body: Center(
        child: BlocBuilder<EmployeeBloc, EmployeeState>(
          builder: (context, state) {
            if (state is EmployeeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is EmployeeLoadedState) {
              return ListView.builder(
                itemCount: state.employee.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(
                        state.employee[index].name?.first ?? "No first name"),
                    subtitle: Text(
                        state.employee[index].name?.last ?? "No last name"),
                  ),
                ),
              );
            }

            if (state is EmployeeErrorState) {
              return Center(child: Text("EmployeeErrorState ${state.error}"));
            }

            return Text("block $state");
          },
        ),
      ),
    );
  }
}
