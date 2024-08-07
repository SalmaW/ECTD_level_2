import 'package:ectd2/day008/widgets/emp_list_w.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/employee_bloc.dart';
import '../model/employee.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: const Text("Enter employee details"),
                  content: const TextField(
                    decoration: InputDecoration(labelText: "Name"),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        var emp = Employee.fromJson({
                          "username": "admin",
                          "password": "admin",
                          "name": {"first": "Salma", "last": "Maarouf"},
                          "ssn": "123-45-6789",
                          "dob": "1900-01-01T06:00:00.000Z",
                          "hiredOn": "1900-01-01T06:00:00.000Z",
                          "terminatedOn": null,
                          "email": "admin@company.com",
                          "phones": [
                            {"type": "office", "number": "123-456-7890"}
                          ],
                          "address": {
                            "street": "7251 Walnut Hill Ln",
                            "city": "Scurry",
                            "state": "Oregon",
                            "zip": "36713"
                          },
                          "roles": [
                            "admin",
                            "salaried",
                            "full time",
                            "employee"
                          ],
                          "department": "Human Resources",
                          "gender": "male",
                          "portrait": "portraits/admin.jpg",
                          "thumbnail": "portraits/admin-thumb.jpg"
                        });
                        context.read<EmployeeBloc>().add(AddEmployeeEvent(emp));
                      },
                      child: BlocBuilder<EmployeeBloc, EmployeeState>(
                        buildWhen: (previous, current) =>
                            current is EmployeeAddedState,
                        builder: (context, state) {
                          if (state is EmployeeAddedSuccessfullyState) {
                            Navigator.pop(context);
                            // const SnackBar(
                            //     backgroundColor: Colors.green,
                            //     content: Text("Category Saved Successfully"));
                            return const SizedBox.shrink();
                          }
                          if (state is EmployeeAddedLoadingState) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (state is EmployeeAddedErrorState) {
                            return Center(
                                child: Text(
                                    "EmployeeErrorState ${state.addError}"));
                          }

                          return const Text("Add");
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                    ),
                  ],
                );
              });
        },
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Home - Bloc'),
      ),
      body: Center(
        child: BlocBuilder<EmployeeBloc, EmployeeState>(
          buildWhen: (previous, current) => current is! EmployeeAddedState,
          builder: (context, state) {
            if (state is EmployeeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is EmployeeLoadedState) {
              if (state.employee.isEmpty) {
                return const Center(child: Text("No employee found"));
              } else {
                return EmpListW(employees: state.employee);
              }
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
