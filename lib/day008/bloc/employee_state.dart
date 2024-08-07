part of 'employee_bloc.dart';

@immutable
sealed class EmployeeState {}

@immutable
sealed class EmployeeAddedState extends EmployeeState {}

final class EmployeeLoadingState extends EmployeeState {}

final class EmployeeLoadedState extends EmployeeState {
  final List<Employee> employee;

  EmployeeLoadedState(this.employee);
}

final class EmployeeLoadedDataState extends EmployeeState {
  final List<Employee> employee;

  EmployeeLoadedDataState(this.employee);
}

final class EmployeeErrorState extends EmployeeState {
  final String error;

  EmployeeErrorState(this.error);
}

final class EmployeeAddingState extends EmployeeAddedState {}

final class EmployeeAddedLoadingState extends EmployeeAddedState {}

final class EmployeeAddedSuccessfullyState extends EmployeeAddedState {}

final class EmployeeAddedErrorState extends EmployeeAddedState {
  final String addError;

  EmployeeAddedErrorState(this.addError);
}
