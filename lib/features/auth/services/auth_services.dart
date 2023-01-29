// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:flutter/rendering.dart';
import 'package:noon_app/core/utils/messenger/messenger.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const LOGIN_STATE = 'LOGIN_STATE';

class AuthServices {
  static Future<bool> isLoggedIn() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(LOGIN_STATE) ?? false;
  }

  Future<bool> signIn(String email, String password) async {
    try {
      // TODO : auth method

      SharedPreferences.getInstance()
          .then((pref) => pref.setBool(LOGIN_STATE, true));
      return true;
    } catch (e) {
      Messenger.showSnackBar(e.toString());
      debugPrint(e.toString());
      return false;
    }
  }
}
