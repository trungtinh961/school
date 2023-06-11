import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/constants/image/image_constant.dart';

part 'subject_model.g.dart';

@JsonSerializable()
class SubjectModel {
  final int? id;
  final String? name;
  String? url;
  final MenuType? type;
  final List<SubContentModel>? content;

  SubjectModel({
    this.id,
    this.name,
    this.url,
    this.type,
    this.content,
  });

  Map<String, dynamic> toFirestore() => {
        'name': name,
        'url': url,
        'type': _$MenuTypeEnumMap[type],
        'content': FieldValue.arrayUnion(
            content?.map((e) => e.toJson()).toList() ?? [])
      };

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectModelToJson(this);
}

@JsonSerializable()
class SubContentModel {
  final String? name;
  final String? url;
  @JsonKey(unknownEnumValue: MenuType.subject)
  final MenuType? type;

  SubContentModel({this.name, this.url, this.type});

  factory SubContentModel.fromJson(Map<String, dynamic> json) =>
      _$SubContentModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubContentModelToJson(this);
}

enum MenuType {
  @JsonValue('subject')
  subject,
  @JsonValue('feedback')
  feedback,
}

extension MenuImage on MenuType {
  String get getImage {
    switch (this) {
      case MenuType.subject:
        return ImageConstants.instance.booksIcon;
      case MenuType.feedback:
        return ImageConstants.instance.feedbackIcon;
      default:
        return '';
    }
  }
}
