import 'package:flutter/material.dart';
import 'package:noon_app/features/home/pages/home_page.dart';
import 'bottom_nav.dart';

/// base App
class BasePage extends StatelessWidget {
  static const routeName = '/';
  final _pages = const [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) => _pages[index],
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
