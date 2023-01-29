import 'package:flutter/material.dart';
import '../features/app/widgets/base_app.dart';
import '../features/auth/pages/login_page.dart';

class Routes {
  static const initialRoute = LoginPage.routeName;

  static final routes = <String, WidgetBuilder>{
    BasePage.routeName: (context) => const BasePage(),
    LoginPage.routeName: (context) => const LoginPage(),
  };
}
