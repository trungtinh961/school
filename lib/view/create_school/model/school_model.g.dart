// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolModel _$SchoolModelFromJson(Map<String, dynamic> json) => SchoolModel(
      id: json['id'] as String?,
      userEmail: json['userEmail'] as String?,
      name: json['name'] as String?,
      province: json['province'] == null
          ? null
          : ProvinceModel.fromJson(json['province'] as Map<String, dynamic>),
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => SubjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SchoolModelToJson(SchoolModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userEmail': instance.userEmail,
      'province': instance.province,
      'subjects': instance.subjects,
    };
