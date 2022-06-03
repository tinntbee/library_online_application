import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:library_online_application/models/app_user.dart';

class SessionProvider extends ChangeNotifier {
  AppUser? user;

  void setUser(AppUser newUser) {
    user = newUser;
    notifyListeners();
  }
}
