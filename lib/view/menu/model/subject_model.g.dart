// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) => SubjectModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      type: $enumDecodeNullable(_$MenuTypeEnumMap, json['type']),
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => SubContentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectModelToJson(SubjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'type': _$MenuTypeEnumMap[instance.type],
      'content': instance.content,
    };

const _$MenuTypeEnumMap = {
  MenuType.subject: 'subject',
  MenuType.feedback: 'feedback',
};

SubContentModel _$SubContentModelFromJson(Map<String, dynamic> json) =>
    SubContentModel(
      name: json['name'] as String?,
      url: json['url'] as String?,
      type: $enumDecodeNullable(_$MenuTypeEnumMap, json['type'],
          unknownValue: MenuType.subject),
    );

Map<String, dynamic> _$SubContentModelToJson(SubContentModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'type': _$MenuTypeEnumMap[instance.type],
    };
