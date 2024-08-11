import 'dart:convert';

import 'package:ectd2/day007/task/model/employee.dart';
import 'package:flutter/services.dart';

class EmpRepo {
  Future<List<Employee>?> getEmployees() async {
    try {
      var jsonEmpData =
          await rootBundle.loadString('assets/json/employees.json');
      var employees = json.decode(jsonEmpData);
      return List<Employee>.from(
          employees.map((json) => Employee.fromJson(json)).toList());
    } catch (e) {
      rethrow;
    }
  }
}
