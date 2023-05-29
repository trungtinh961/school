import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/school_model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('school');

class CreateSchoolService {
  Future<void> updateUrl({
    required SchoolModel model,
  }) async {
    DocumentReference documentReferencer = _mainCollection.doc(model.id);
    Map<String, dynamic> data = model.toFirestore();

    await documentReferencer
        .update(data)
        .whenComplete(() => log("Note item updated in the database"))
        .catchError((e) => log(e));
  }
}