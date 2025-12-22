import 'package:employees_app/domain/models/employee/employee.dart';
import 'package:employees_app/domain/repositories/employees_repository.dart';

class EmployeesRepositoryMock implements EmployeesRepository {
  @override
  Future<List<Employee>> getAllEmployees() async {
    await Future.delayed(const Duration(seconds: 3));
    return [
      Employee(
        id: 1,
        employeeName: 'John Doe',
        employeeSalary: 100000,
        employeeAge: 30,
        profileImage: '',
      ),
      Employee(
        id: 2,
        employeeName: 'Jane Doe',
        employeeSalary: 110000,
        employeeAge: 32,
        profileImage: '',
      ),
      Employee(
        id: 3,
        employeeName: 'Jim Beam',
        employeeSalary: 120000,
        employeeAge: 34,
        profileImage: '',
      ),
    ];
  }

  @override
  Future<Employee?> getEmployeeById(String id) async {
    return Employee(
      id: 1,
      employeeName: 'John Doe',
      employeeSalary: 100000,
      employeeAge: 25,
      profileImage: '',
    );
  }

  @override
  Future<String?> createEmployee(Employee employee) async {
    return '1';
  }

  @override
  Future<Employee> updateEmployee(Employee employee) async {
    return employee;
  }

  @override
  Future<void> deleteEmployee(String id) async {
    return;
  }
}
