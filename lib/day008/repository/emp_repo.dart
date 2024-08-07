import 'dart:convert';

import 'package:ectd2/day008/model/employee.dart';
import 'package:flutter/services.dart';

class EmpRepo {
  static List<Employee> empList = [];

  Future<List<Employee>?> getEmployees() async {
    try {
      var jsonEmpData =
          await rootBundle.loadString('assets/json/employees.json');
      var employees = json.decode(jsonEmpData);
      return empList = List<Employee>.from(
          employees.map((json) => Employee.fromJson(json)).toList());
    } catch (e) {
      rethrow;
    }
  }
}
