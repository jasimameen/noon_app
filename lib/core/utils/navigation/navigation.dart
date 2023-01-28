import 'package:flutter/material.dart';

/// get access to the current state of Navigator
class Navigation {
  static final _instance = GlobalKey<NavigatorState>();
  static getInstance() => _instance;

  /// route used to get all navigation functionalities
  static NavigatorState route = _instance.currentState!; 
}
