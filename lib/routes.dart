import 'package:flutter/widgets.dart';
import 'package:flutter_medical/screens/login/login_screen.dart';
import 'package:flutter_medical/screens/unboard/unboard_screen.dart';


final Map<String, WidgetBuilder> routes = {
  UnboardScreen.routeName: (context) => UnboardScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
};