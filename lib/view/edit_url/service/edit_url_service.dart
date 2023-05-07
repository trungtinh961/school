import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../menu/model/subject_model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('cb001');

class EditUrlService {
  Future<void> updateUrl({
    required SubjectModel model,
  }) async {
    DocumentReference documentReferencer = _mainCollection.doc(model.id);
    Map<String, dynamic> data = model.toFirestore();

    await documentReferencer
        .update(data)
        .whenComplete(() => log("Note item updated in the database"))
        .catchError((e) => log(e));
  }
}
