// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
  id: (json['id'] as num).toInt(),
  employeeName: json['employeeName'] as String,
  employeeSalary: _parseStringToDouble(json['employeeSalary'] as String),
  employeeAge: _parseStringToInt(json['employeeAge'] as String),
  profileImage: json['profileImage'] as String,
);

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
  'id': instance.id,
  'employeeName': instance.employeeName,
  'employeeSalary': _parseDoubleToString(instance.employeeSalary),
  'employeeAge': _parseIntToString(instance.employeeAge),
  'profileImage': instance.profileImage,
};
