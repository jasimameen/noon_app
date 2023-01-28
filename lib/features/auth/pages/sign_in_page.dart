import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  static const routeName = '/sign-in';
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('sign in page'),
      ),
    );
  }
}
