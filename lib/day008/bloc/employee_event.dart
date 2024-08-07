part of 'employee_bloc.dart';

@immutable
sealed class EmployeeEvent {}

class LoadEmployeeEvent extends EmployeeEvent {}

class AddEmployeeEvent extends EmployeeEvent {
  final Employee employee;

  AddEmployeeEvent(this.employee);
}
