import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_school/view/menu/model/subject_model.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/enums/locale_keys_enum.dart';
import '../../../core/constants/navigation/navigation_constants.dart';

part 'webview_view_model.g.dart';

class WebviewViewModel = _WebviewViewModel with _$WebviewViewModel;

abstract class _WebviewViewModel with Store, BaseViewModel {
  _WebviewViewModel(this._subjectModel);

  @observable
  SubjectModel _subjectModel;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}

  void onEdit() {
    navigation.navigateToPage(
      path: NavigationConstants.EDIT_URL_VIEW,
      data: _subjectModel,
    );
  }

  bool canEdit() {
    return localeManager.getStringValue(PreferencesKeys.USER_ROLE) == 'teacher';
  }
}
