// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MenuViewModel on _MenuViewModel, Store {
  late final _$listSubjectAtom =
      Atom(name: '_MenuViewModel.listSubject', context: context);

  @override
  List<SubjectModel> get listSubject {
    _$listSubjectAtom.reportRead();
    return super.listSubject;
  }

  @override
  set listSubject(List<SubjectModel> value) {
    _$listSubjectAtom.reportWrite(value, super.listSubject, () {
      super.listSubject = value;
    });
  }

  late final _$listFeedbackAtom =
      Atom(name: '_MenuViewModel.listFeedback', context: context);

  @override
  List<SubjectModel> get listFeedback {
    _$listFeedbackAtom.reportRead();
    return super.listFeedback;
  }

  @override
  set listFeedback(List<SubjectModel> value) {
    _$listFeedbackAtom.reportWrite(value, super.listFeedback, () {
      super.listFeedback = value;
    });
  }

  @override
  String toString() {
    return '''
listSubject: ${listSubject},
listFeedback: ${listFeedback}
    ''';
  }
}
