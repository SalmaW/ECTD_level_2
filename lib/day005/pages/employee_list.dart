import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'empData.dart';
import 'home.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  List<dynamic> _employees = [];
  bool isLoading = false;

  @override
  void initState() {
    initList();
    super.initState();
  }

  void initList() async {
    setState(() {
      isLoading = true;
    });
    var result = await rootBundle.loadString("assets/json/employees.json");
    var response = jsonDecode(result);
    _employees = response;

    setState(() {
      isLoading = false;
    });
  }

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
        title: ValueListenableBuilder(
            valueListenable: counterNotifier,
            builder: (context, value, _) {
              return Text("Employees List ${counterNotifier.value}");
            }),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: _employees
                  .map((e) => ListTile(
                      title: Text(e["username"]),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => EmployeeData(emp: e)));
                      }))
                  .toList(),
            ),
    );
  }
}
