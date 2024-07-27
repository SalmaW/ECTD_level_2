import 'package:flutter/material.dart';

import 'home.dart';

class EmployeeData extends StatefulWidget {
  final dynamic emp;

  const EmployeeData({required this.emp, super.key});

  @override
  State<EmployeeData> createState() => _EmployeeDataState();
}

class _EmployeeDataState extends State<EmployeeData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counterNotifier.value++;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Employee Data: ${widget.emp["username"]}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: widget.emp.entries.map<Widget>((entry) {
            return Card(
              child: ListTile(
                title: Text(
                  entry.key,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(entry.value.toString()),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
