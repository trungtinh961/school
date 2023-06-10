import 'package:json_annotation/json_annotation.dart';
part 'province_model.g.dart';

@JsonSerializable()
class ProvinceModel {
  final int? code;
  final String? name;
  final String? codename;
  final int? phone_code;

  ProvinceModel({
    this.code,
    this.name,
    this.codename,
    this.phone_code,
  });

  Map<String, dynamic> toFirestore() => {
        'code': code,
        'name': name,
        'codename': codename,
        'phone_code': phone_code,
      };

  factory ProvinceModel.fromJson(Map<String, dynamic> json) =>
      _$ProvinceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProvinceModelToJson(this);
}
