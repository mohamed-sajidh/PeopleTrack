import 'package:flutter/material.dart';

class AddPersonalDetailsViewmodel extends ChangeNotifier {
  bool colonyOwnerValue = false;
  bool chemApplicatorValue = false;
  bool landOwnerValue = false;
  bool isStatusOn = false;

  void changeColonyOwnerValue() {
    colonyOwnerValue = !colonyOwnerValue;
    notifyListeners();
  }

  void changeChemApplicatorValue() {
    chemApplicatorValue = !chemApplicatorValue;
    notifyListeners();
  }

  void changeLandOwnerValue() {
    landOwnerValue = !landOwnerValue;
    notifyListeners();
  }

  void changeStatus() {
    isStatusOn = !isStatusOn;
    notifyListeners();
  }
}
