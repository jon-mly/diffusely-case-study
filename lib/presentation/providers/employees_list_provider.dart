import 'package:employees_app/domain/models/employee/employee.dart';
import 'package:employees_app/presentation/providers/services/employee_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AsyncNotifierProvider<EmployeesNotifier, List<Employee>>
employeesListProvider = .new(EmployeesNotifier.new);

class EmployeesNotifier extends AsyncNotifier<List<Employee>> {
  EmployeesNotifier();

  @override
  Future<List<Employee>> build() async {
    return await ref.read(employeeServiceProvider).getAllEmployees();
  }

  Future<void> fetchEmployees() async {
    state = .loading();
    final List<Employee> employees = await ref
        .read(employeeServiceProvider)
        .getAllEmployees();
    state = AsyncData(employees);
  }
}
