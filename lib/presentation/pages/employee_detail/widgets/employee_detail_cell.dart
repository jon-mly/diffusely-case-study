import 'package:easy_localization/easy_localization.dart';
import 'package:employees_app/domain/models/employee/employee.dart';
import 'package:employees_app/presentation/style/fonts.dart';
import 'package:employees_app/presentation/style/spacings.dart';
import 'package:employees_app/presentation/widgets/card.dart';
import 'package:flutter/material.dart';

class EmployeeDetailCell extends StatelessWidget {
  const EmployeeDetailCell({super.key, required this.employee});

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    final NumberFormat numberFormat = NumberFormat.currency(
      symbol: '€',
      decimalDigits: 0,
      locale: context.locale.toString(),
    );

    return AppCard(
      child: Column(
        spacing: AppSpacing.s,
        children: [
          _buildDataLine(context.tr('employeeDetail.cell.id'), employee.id.toString()),
          _buildDataLine(
            context.tr('employeeDetail.cell.name'),
            employee.employeeName,
          ),
          _buildDataLine(
            context.tr('employeeDetail.cell.salary'),
            numberFormat.format(employee.employeeSalary),
          ),
          _buildDataLine(
            context.tr('employeeDetail.cell.age'),
            context.tr(
              'employeeDetail.cell.ageSuffix',
              args: [employee.employeeAge.toString()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataLine(String label, String value) {
    return Row(
      spacing: AppSpacing.s,
      children: [
        Expanded(child: Text(label, style: AppFonts.text)),
        Text(value, style: AppFonts.h3),
      ],
    );
  }
}
