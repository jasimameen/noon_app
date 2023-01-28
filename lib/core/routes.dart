import 'package:flutter/material.dart';
import 'package:noon_app/features/app/widgets/base_app.dart';
import 'package:noon_app/features/auth/pages/sign_in_page.dart';
import 'package:noon_app/features/auth/pages/sign_out_page.dart';
import 'package:noon_app/features/home/pages/home_page.dart';

class Routes {
  static const initialRoute = HomePage.routeName;

  static final routes = <String, WidgetBuilder>{
    BasePage.routeName: (context) => const BasePage(),
    SignInPage.routeName: (context) => const SignInPage(),
    SignOutPage.routeName: (context) => const SignOutPage(),
  };
}
