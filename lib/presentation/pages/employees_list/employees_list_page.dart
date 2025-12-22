import 'package:easy_localization/easy_localization.dart';
import 'package:employees_app/domain/models/employee/employee.dart';
import 'package:employees_app/presentation/pages/employees_list/widgets/employee_cell.dart';
import 'package:employees_app/presentation/pages/employees_list/widgets/employee_loading_cell.dart';
import 'package:employees_app/presentation/providers/employees_list_provider.dart';
import 'package:employees_app/presentation/style/spacings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EmployeesListPage extends ConsumerWidget {
  const EmployeesListPage({super.key});

  //
  // Actions
  //

  void _presentEmployeeDetail(BuildContext context, Employee employee) {
    context.push('/employee/${employee.id}');
  }

  //
  // UI
  //

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Employee>> employeesValue = ref.watch(
      employeesListProvider,
    );

    return Scaffold(
      appBar: AppBar(title: Text(context.tr('employees.title'))),
      body: employeesValue.when(
        data: (employeesList) => _buildEmployeesList(context, employeesList),
        error: (error, stackTrace) => _buildError(context, error),
        loading: () => _buildLoading(context),
      ),
    );
  }

  Widget _buildEmployeesList(BuildContext context, List<Employee> employees) {
    return ListView.separated(
      itemCount: employees.length,
      padding: AppSpacing.screenPaddingHorizontal,
      separatorBuilder: (_, _) => AppSpacing.verticalM,
      itemBuilder: (context, index) => EmployeeCell(
        employee: employees[index],
        onTap: () => _presentEmployeeDetail(context, employees[index]),
      ),
    );
  }

  Widget _buildError(BuildContext context, Object error) {
    return Padding(
      padding: AppSpacing.screenPaddingAll,
      child: Center(child: Text(error.toString())),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Padding(
      padding: AppSpacing.screenPaddingHorizontal,
      child: Column(
        spacing: AppSpacing.sectionSpacing,
        mainAxisAlignment: .start,
        children: [
          Column(
            spacing: AppSpacing.m,
            children: List.generate(3, (index) => const EmployeeLoadingCell()),
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
