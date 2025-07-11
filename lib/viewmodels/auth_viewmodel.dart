import 'package:flutter/material.dart';

class AuthViewmodel extends ChangeNotifier {
  bool isChecked = false;

  void changeCheckedbox() {
    isChecked = !isChecked;
    notifyListeners();
  }
}
