import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_school/view/create_school/service/create_school_service.dart';

import '../../../core/base/model/base_view_model.dart';

part 'create_school_viewmodel.g.dart';

class CreateSchoolViewModel = _CreateSchoolViewModel
    with _$CreateSchoolViewModel;

abstract class _CreateSchoolViewModel with Store, BaseViewModel {
   _CreateSchoolViewModel(this._createSchoolService);

  final CreateSchoolService _createSchoolService;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}
}
