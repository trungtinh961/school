import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../menu/model/subject_model.dart';
import '../service/edit_url_service.dart';

part 'edit_url_view_model.g.dart';

// ignore: library_private_typeublic_api
class EditUrlViewModel = _EditUrlViewModel with _$EditUrlViewModel;

abstract class _EditUrlViewModel with Store, BaseViewModel {
  _EditUrlViewModel(this._editService, {this.model});

  final EditUrlService _editService;
  final SubjectModel? model;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}

  void updateUrl(String url) {
    if (model == null) return;
    model!.url = url;
    _editService.updateUrl(model: model!);
  }

  bool isValidURL(String url) {
    RegExp urlRegex = RegExp(
        r"^((http|https):\/\/)?[a-z0-9]+\.[a-z]+(\/[a-zA-Z0-9#]+\/?)*$",
        caseSensitive: false,
        multiLine: false);
    return urlRegex.hasMatch(url);
  }
}
