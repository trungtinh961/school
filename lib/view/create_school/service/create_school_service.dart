import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_school/view/create_school/model/province_model.dart';
import '../../../core/constants/app/app_constants.dart';
import '../model/school_model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _provinceCollection =
    _firestore.collection(ApplicationConstants.PROVINCE_COLLECTION);
final CollectionReference _schoolCollection =
    _firestore.collection(ApplicationConstants.SCHOOL_COLLECTION);

class CreateSchoolService {
  Future<void> uploadProvinces({
    required List<ProvinceModel> provinces,
  }) async {
    for (var i = 0; i < provinces.length; i++) {
      await _provinceCollection
          .doc(provinces[i].codename)
          .set(provinces[i].toFirestore())
          .whenComplete(() => log("Note item updated in the database"))
          .catchError((e) => log(e));
    }
  }

  Future<List<ProvinceModel>> getListProvince() async {
    final querySnapshot = await _provinceCollection.orderBy('code').get();
    List<ProvinceModel> datas = querySnapshot.docs.map((e) {
      final data = e.data() as Map<String, dynamic>;
      return ProvinceModel.fromJson(data);
    }).toList();
    return datas;
  }

  Future<SchoolModel> createSchool(String name, ProvinceModel? province) async {
    final schoolModel = SchoolModel(
      name: name,
      userEmail: '',
      province: province,
      subjects: ApplicationConstants.DEFAULT_SUBJECT,
    );
    final docRef = await _schoolCollection.add(schoolModel.toFirestore());
    final docSnapshot = await docRef.get();
    final data = docSnapshot.data() as Map<String, dynamic>;
    data['id'] = docSnapshot.id;
    return SchoolModel.fromJson(data);
  }

  Future<List<SchoolModel>> getListSchool() async {
    final querySnapshot =
        await _schoolCollection.orderBy('name', descending: true).get();
    List<SchoolModel> datas = querySnapshot.docs.map((e) {
      final data = e.data() as Map<String, dynamic>;
      data['id'] = e.id;
      return SchoolModel.fromJson(data);
    }).toList();
    return datas;
  }

  Future<SchoolModel> getSchool(String email) async {
    final querySnapshot =
        await _schoolCollection.where("email", isEqualTo: email).get();
    List<SchoolModel> datas = querySnapshot.docs.map((e) {
      final data = e.data() as Map<String, dynamic>;
      return SchoolModel.fromJson(data);
    }).toList();
    return datas.first;
  }
}
