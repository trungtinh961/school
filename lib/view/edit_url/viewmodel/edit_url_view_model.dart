import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../service/edit_url_service.dart';

part 'edit_url_view_model.g.dart';

// ignore: library_private_types_in_public_api
class EditUrlViewModel = _EditUrlViewModel with _$EditUrlViewModel;

abstract class _EditUrlViewModel with Store, BaseViewModel {
  _EditUrlViewModel(this._editService);

  final EditUrlService _editService;
  
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}
}
