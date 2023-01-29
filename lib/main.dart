import 'package:flutter/material.dart';

import 'core/routes.dart';
import 'core/utils/messenger/messenger.dart';
import 'core/utils/navigation/navigation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

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
