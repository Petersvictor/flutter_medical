

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_medical/models/user.dart';
import 'package:flutter_medical/services/auth_service.dart';

class UserProvider with ChangeNotifier {
  Users _users;
  Authentication authentication = Authentication();

  Users get getUser => _users;

  void refreshUser() async {
    Users users = await authentication.getUserDetails();
    _users = users;
    notifyListeners();
  }
}