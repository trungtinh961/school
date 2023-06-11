import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_school/view/create_school/service/create_school_service.dart';

import '../../../core/constants/app/app_constants.dart';
import '../../menu/model/subject_model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('cb001');
final CollectionReference _schoolCollection =
    _firestore.collection(ApplicationConstants.SCHOOL_COLLECTION);

class EditUrlService {
  Future<void> updateUrl({
    required String schoolId,
    required SubjectModel model,
  }) async {
    DocumentReference documentReferencer = _schoolCollection.doc(schoolId);

    final school = await CreateSchoolService().getSchoolById(schoolId);
    school.subjects?.firstWhere((element) => element.id == model.id).url = model.url;
    Map<String, dynamic> data = school.toFirestore();

    await documentReferencer
        .set(data)
        .whenComplete(() => log("Note item updated in the database"))
        .catchError((e) => log(e));
  }
}
