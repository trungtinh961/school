import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../menu/model/subject_model.dart';
import '../../webview/webview_model.dart';

part 'subject_content_view_model.g.dart'; // This is the generated file.

class SubjectContentViewModel = _SubjectContentViewModel
    with _$SubjectContentViewModel;

abstract class _SubjectContentViewModel with Store, BaseViewModel {
  _SubjectContentViewModel({this.model});

  @observable
  List<SubContentModel> listContent = [];
  final SubjectModel? model;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    getListContent();
  }

  void getListContent() {
    listContent = model?.content ?? [];
  }

  void onSelectMenu(SubContentModel? item) {
    navigation.navigateToPage(
        path: NavigationConstants.WEB_VIEW,
        data: WebViewModel(
          item?.name ?? '',
          url: item?.url,
        ));
  }
}
