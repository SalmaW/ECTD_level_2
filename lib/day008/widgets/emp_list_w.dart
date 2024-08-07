import 'package:flutter/material.dart';

import '../model/employee.dart';

class EmpListW extends StatefulWidget {
  final List<Employee> employees;

  const EmpListW({required this.employees, super.key});

  @override
  State<EmpListW> createState() => _EmpListWState();
}

class _EmpListWState extends State<EmpListW> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.employees.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(widget.employees[index].name?.first ?? "No first name"),
          subtitle: Text(widget.employees[index].name?.last ?? "No last name"),
        ),
      ),
    );
  }
}
