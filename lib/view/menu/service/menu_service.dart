import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_school/core/constants/app/app_constants.dart';
import 'package:smart_school/view/create_school/model/school_model.dart';
import '../model/subject_model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _schoolCollection =
    _firestore.collection(ApplicationConstants.SCHOOL_COLLECTION);

class MenuServices {
  Future<void> addItem({
    required String? subjectId,
    required SubjectModel model,
  }) async {
    DocumentReference documentReferencer = _schoolCollection.doc(subjectId);
    Map<String, dynamic> data = model.toFirestore();

    await documentReferencer
        .set(data)
        .whenComplete(() => log("Note item added to the database"))
        .catchError((e) => log(e));
  }

  Future<void> updateItem({
    required String subjectId,
    required SubjectModel model,
  }) async {
    DocumentReference documentReferencer = _schoolCollection.doc(subjectId);
    Map<String, dynamic> data = model.toFirestore();

    await documentReferencer
        .update(data)
        .whenComplete(() => log("Note item updated in the database"))
        .catchError((e) => log(e));
  }

  Future<SchoolModel> getSchool(String schoolId) async {
    final querySnapshot = await _schoolCollection.doc(schoolId).get();
    final data = querySnapshot.data() as Map<String, dynamic>;
    return SchoolModel.fromJson(data);
  }

  Future<void> deleteItem({
    required String subjectId,
  }) async {
    DocumentReference documentReferencer =
        _schoolCollection.doc(subjectId).collection('items').doc(subjectId);

    await documentReferencer
        .delete()
        .whenComplete(() => log('Note item deleted from the database'))
        .catchError((e) => log(e));
  }
}
