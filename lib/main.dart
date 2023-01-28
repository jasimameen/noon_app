import 'package:flutter/material.dart';
import 'package:noon_app/core/routes.dart';
import 'package:noon_app/core/utils/messenger/messenger.dart';
import 'package:noon_app/core/utils/navigation/navigation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Navigation.getInstance(),
      scaffoldMessengerKey: Messenger.getInstance(),
      title: 'Noon App',
      initialRoute: Routes.initialRoute,
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
