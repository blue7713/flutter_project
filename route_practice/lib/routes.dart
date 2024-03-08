import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';

final Map<String, WidgetBuilder> routes = {
  '/home': (context) => Home(),
  '/profile': (context) => Profile(),
};