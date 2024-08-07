import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../model/employee.dart';
import '../repository/emp_repo.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmpRepo _employeeRepository;

  EmployeeBloc(this._employeeRepository) : super(EmployeeLoadingState()) {
    on<LoadEmployeeEvent>(loadEmployee);
    on<AddEmployeeEvent>(addedEmployee);
  }

  FutureOr<void> loadEmployee(
      LoadEmployeeEvent event, Emitter<EmployeeState> emit) async {
    emit(EmployeeLoadingState());

    await _employeeRepository.getEmployees().then((employees) {
      emit(EmployeeLoadedState(employees!));
    }).catchError((error) {
      emit(EmployeeErrorState(error.toString()));
    });
  }

  FutureOr<void> addedEmployee(
      AddEmployeeEvent event, Emitter<EmployeeState> emit) async {
    emit(EmployeeAddedLoadingState());
    await Future.delayed(const Duration(seconds: 2));

    EmpRepo.empList.add(event.employee);
    var updatedList = EmpRepo.empList;
    emit(EmployeeLoadedState(updatedList));
    emit(EmployeeAddedSuccessfullyState());
  }
}
