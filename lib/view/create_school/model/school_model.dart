import 'package:json_annotation/json_annotation.dart';
part 'school_model.g.dart';

@JsonSerializable()
class SchoolModel {
  final String? id;
  final String? name;
  final String? province;

  SchoolModel({
    this.id,
    this.name,
    this.province,
  });

  Map<String, dynamic> toFirestore() => {
        'name': name,
        'url': province,
      };

  factory SchoolModel.fromJson(Map<String, dynamic> json) =>
      _$SchoolModelFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolModelToJson(this);
}
