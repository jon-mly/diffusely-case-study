import 'package:easy_localization/easy_localization.dart';
import 'package:employees_app/domain/models/employee/employee.dart';
import 'package:employees_app/presentation/pages/employee_detail/widgets/employee_detail_cell.dart';
import 'package:employees_app/presentation/providers/enployee_detail_provider.dart';
import 'package:employees_app/presentation/style/spacings.dart';
import 'package:employees_app/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmployeeDetailPage extends ConsumerWidget {
  const EmployeeDetailPage({super.key, required this.employeeId});

  final String employeeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Employee?> employeeValue = ref.watch(
      employeeDetailProvider(employeeId),
    );
    return Scaffold(
      appBar: AppBar(title: Text(context.tr('employeeDetail.title'))),
      body: Padding(
        padding: AppSpacing.screenPaddingHorizontal,
        child: employeeValue.when(
          data: (employee) => employee != null
              ? _buildEmployeeDetail(context, employee)
              : _buildError(context, 'Employee not found'),
          error: (error, stackTrace) => _buildError(context, error),
          loading: () => _buildLoading(context),
        ),
      ),
    );
  }

  Widget _buildEmployeeDetail(BuildContext context, Employee employee) {
    return Column(
      spacing: AppSpacing.sectionSpacing,
      crossAxisAlignment: .stretch,
      children: [
        EmployeeDetailCell(employee: employee),
        Row(
          spacing: AppSpacing.s,
          children: [
            Expanded(
              child: AppButton(
                text: context.tr('employeeDetail.delete'),
                onPressed: () {},
                destructive: true,
              ),
            ),
            Expanded(
              child: AppButton(
                text: context.tr('employeeDetail.edit'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildError(BuildContext context, Object error) {
    return Center(child: Text(error.toString()));
  }

  Widget _buildLoading(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
