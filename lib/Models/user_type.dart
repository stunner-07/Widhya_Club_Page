import 'package:flutter/material.dart';

class UserType with ChangeNotifier {
  int _u;
  int get user {
    return _u;
  }

  int adminLogin() {
    _u = 1;
    notifyListeners();
  }

  int studentLogin() {
    _u = 0;
    notifyListeners();
  }
}
