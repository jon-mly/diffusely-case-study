import 'package:employees_app/domain/models/employee/employee.dart';
import 'package:employees_app/presentation/providers/services/employee_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final employeeDetailProvider = FutureProvider.autoDispose
    .family<Employee?, String>((ref, employeeId) async {
      return ref.read(employeeServiceProvider).getEmployeeById(employeeId);
    });
