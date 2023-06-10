// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProvinceModel _$ProvinceModelFromJson(Map<String, dynamic> json) =>
    ProvinceModel(
      code: json['code'] as int?,
      name: json['name'] as String?,
      codename: json['codename'] as String?,
      phone_code: json['phone_code'] as int?,
    );

Map<String, dynamic> _$ProvinceModelToJson(ProvinceModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'codename': instance.codename,
      'phone_code': instance.phone_code,
    };
