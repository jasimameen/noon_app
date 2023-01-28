import 'package:flutter/material.dart';

/// get access to all Alerts, SnackBars.. etc
class Messenger {
  static final _instance = GlobalKey<ScaffoldMessengerState>();
  static getInstance() => _instance;

  /// route used to get all navigation functionalities
  static final _currentState = _instance.currentState!;

  static showSnackBar(String message) {
    _currentState.removeCurrentSnackBar();
    _currentState.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'close',
          onPressed: () => _currentState.removeCurrentSnackBar(),
        ),
        elevation: 10,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}