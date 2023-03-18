
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:architecture_widgets/src/card/not_found_navigation_widget.dart';
import '../../../product/exception/navigate_model_not_found.dart';
import '../../../view/menu/model/menu_model.dart';
import '../../../view/menu/view/menu_view.dart';
import '../../../view/splash/view/splash_view.dart';
import '../../../view/subject_detail/view/subject_content_view.dart';
import '../../../view/webview/view/dynamic_webview.dart';
import '../../../view/webview/webview_model.dart';
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
        return normalNavigate(const MenuView(), NavigationConstants.MENU_VIEW);

      case NavigationConstants.SUBJECT_CONTENT_VIEW:
        if (args.arguments is MenuModel) {
          return normalNavigate(
              SubjectContentView(menuItem: args.arguments as MenuModel),
              NavigationConstants.SUBJECT_CONTENT_VIEW);
        }
        throw NavigateException<MenuModel>(args.arguments);
        
      case NavigationConstants.WEB_VIEW:
        if (args.arguments is WebViewModel) {
          return normalNavigate(
              DynamicWebView(model: args.arguments as WebViewModel),
              NavigationConstants.WEB_VIEW);
        }
        throw NavigateException<MenuModel>(args.arguments);

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
