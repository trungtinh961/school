import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:smart_school/view/create_school/model/province_model.dart';

import '../../menu/model/subject_model.dart';
part 'school_model.g.dart';

@JsonSerializable()
class SchoolModel {
  final String? name;
  final String? userEmail;
  final ProvinceModel? province;
  final List<SubjectModel>? subjects;

  SchoolModel({
    this.userEmail,
    this.name,
    this.province,
    this.subjects,
  });

  Map<String, dynamic> toFirestore() => {
        'name': name,
        'userEmail': userEmail,
        'province': province?.toJson(),
        'subjects': FieldValue.arrayUnion(
            subjects?.map((e) => e.toJson()).toList() ?? []),
      };

  factory SchoolModel.fromJson(Map<String, dynamic> json) =>
      _$SchoolModelFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolModelToJson(this);
}
