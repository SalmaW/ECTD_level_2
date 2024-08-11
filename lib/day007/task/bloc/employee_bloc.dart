import 'package:bloc/bloc.dart';
import 'package:ectd2/day007/task/model/employee.dart';
import 'package:ectd2/day007/task/repository/emp_repo.dart';
import 'package:meta/meta.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmpRepo _employeeRepository;

  EmployeeBloc(this._employeeRepository) : super(EmployeeLoadingState()) {
    on<LoadEmployeeEvent>(loadEmployee);
  }

  Future<void> loadEmployee(
      LoadEmployeeEvent event, Emitter<EmployeeState> emit) async {
    emit(EmployeeLoadingState());

    await _employeeRepository.getEmployees().then((employees) {
      emit(EmployeeLoadedState(employees!));
    }).catchError((error) {
      emit(EmployeeErrorState(error.toString()));
    });
  }
}
