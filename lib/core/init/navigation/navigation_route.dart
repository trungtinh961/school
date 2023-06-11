import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:architecture_widgets/src/card/not_found_navigation_widget.dart';
import 'package:smart_school/view/create_school/model/school_model.dart';
import 'package:smart_school/view/edit_url/views/edit_url_view.dart';
import 'package:smart_school/view/menu/model/subject_model.dart';
import 'package:smart_school/view/select_school/view/select_school_view.dart';
import '../../../product/exception/navigate_model_not_found.dart';
import '../../../view/create_school/view/create_school_view.dart';
import '../../../view/menu/view/menu_view.dart';
import '../../../view/splash/view/splash_view.dart';
import '../../../view/subject_detail/view/subject_content_view.dart';
import '../../../view/webview/view/dynamic_webview.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView(), NavigationConstants.DEFAULT);

      case NavigationConstants.MENU_VIEW:
        if (args.arguments is SchoolModel) {
          return normalNavigate(
            MenuView(schoolItem: args.arguments as SchoolModel),
            NavigationConstants.MENU_VIEW,
          );
        }
        throw NavigateException<SubjectModel>(args.arguments);

      case NavigationConstants.CREATE_SCHOOL:
        return normalNavigate(
            const CreateSchoolView(), NavigationConstants.CREATE_SCHOOL);

      case NavigationConstants.SELECT_SCHOOL:
        return normalNavigate(
            const SelectSchoolView(), NavigationConstants.SELECT_SCHOOL);

      case NavigationConstants.EDIT_URL_VIEW:
        if (args.arguments is SubjectModel) {
          return normalNavigate(
              EditUrlView(menuItem: args.arguments as SubjectModel),
              NavigationConstants.EDIT_URL_VIEW);
        }
        throw NavigateException<SubjectModel>(args.arguments);

      case NavigationConstants.SUBJECT_CONTENT_VIEW:
        if (args.arguments is SubjectModel) {
          return normalNavigate(
              SubjectContentView(menuItem: args.arguments as SubjectModel),
              NavigationConstants.SUBJECT_CONTENT_VIEW);
        }
        throw NavigateException<SubjectModel>(args.arguments);

      case NavigationConstants.WEB_VIEW:
        if (args.arguments is SubjectModel) {
          return normalNavigate(
              DynamicWebView(model: args.arguments as SubjectModel),
              NavigationConstants.WEB_VIEW);
        }
        throw NavigateException<SubjectModel>(args.arguments);

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName),
    );
  }
}
