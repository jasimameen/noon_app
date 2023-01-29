// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:noon_app/constants/asset_constants.dart';
import 'package:noon_app/constants/ui_constants.dart';
import 'package:noon_app/core/utils/messenger/messenger.dart';
import 'package:noon_app/core/utils/navigation/navigation.dart';
import 'package:noon_app/features/app/widgets/base_app.dart';
import 'package:noon_app/features/auth/services/auth_services.dart';
import 'package:noon_app/features/auth/widgets/action_button.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() async {
    super.initState();
    if (await AuthServices.isLoggedIn()) {
      Navigation.route.pushReplacementNamed(BasePage.routeName);
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 200,
                      child: SvgPicture.asset(
                        AssetGraphics.noonLogo,
                        fit: BoxFit.contain,
                      )),
                  UIConstants.height40,

                  // email field
                  CustomTextField(
                    controller: emailController,
                    placeHolderText: 'Enter Email Address',
                    prefixIconData: CupertinoIcons.mail,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'not a valid input';
                      }
                      return null;
                    },
                  ),
                  UIConstants.height20,

                  // password field
                  CustomTextField(
                    controller: passwordController,
                    placeHolderText: 'Enter Password',
                    prefixIconData: Icons.vpn_key,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'not a valid input';
                      }
                      if (value.trim().length < 6) return 'short password';

                      return null;
                    },
                  ),

                  UIConstants.height40,

                  // login button
                  ActionButton(
                      label: 'Login',
                      onTap: () => signIn(
                          emailController.text, passwordController.text)),
                  UIConstants.height10,

                  // register button
                  ActionButton(
                    label: 'Register',
                    onTap: () => register(
                      emailController.text,
                      passwordController.text,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      final isSuccess = await AuthServices().signIn(email, password);

      if (isSuccess) {
        Navigation.route.pushReplacementNamed(BasePage.routeName);
        Messenger.showSnackBar('Login Success');
      }
    }
  }

  // login function
  void register(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      signIn(email, password);
    }
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.placeHolderText,
    required this.prefixIconData,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String placeHolderText;
  final IconData prefixIconData;
  final bool obscureText;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      obscureText: true,
      validator: validator,
      onSaved: (value) => controller.text = value!,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIconData),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: placeHolderText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
