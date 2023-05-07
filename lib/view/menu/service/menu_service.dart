import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/subject_model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('cb001');

class MenuServices {
  Future<void> addItem({
    required String? subjectId,
    required SubjectModel model,
  }) async {
    DocumentReference documentReferencer = _mainCollection.doc(subjectId);
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
    DocumentReference documentReferencer = _mainCollection.doc(subjectId);
    Map<String, dynamic> data = model.toFirestore();

    await documentReferencer
        .update(data)
        .whenComplete(() => log("Note item updated in the database"))
        .catchError((e) => log(e));
  }

  Future<List<SubjectModel>> readItems() async {
    final querySnapshot = await _mainCollection.orderBy('type', descending: true).get();
    List<SubjectModel> datas = querySnapshot.docs.map((e) {
      final data = e.data() as Map<String, dynamic>;
      data['id'] = e.id;
      return SubjectModel.fromJson(data);
    }).toList();
    return datas;
  }

  Future<void> deleteItem({
    required String subjectId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(subjectId).collection('items').doc(subjectId);

    await documentReferencer
        .delete()
        .whenComplete(() => log('Note item deleted from the database'))
        .catchError((e) => log(e));
  }
}
