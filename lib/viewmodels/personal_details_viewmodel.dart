import 'package:flutter/material.dart';
import 'package:peopletrack/core/services/personal_details_services.dart';
import 'package:peopletrack/models/personal_details_model.dart';

class PersonalDetailsViewmodel extends ChangeNotifier {
  bool isLoader = false;
  var persoanalDetailsList = <PersonalDetailsModel>[];

  PersonalDetailsViewmodel() {
    getPersonalDetails();
  }

  Future<void> getPersonalDetails() async {
    try {
      isLoader = true;
      notifyListeners();

      List<PersonalDetailsModel> productItems =
          await PersonalDetailsServices.getPersonalDetails();

      if (productItems.isNotEmpty) {
        persoanalDetailsList = productItems;
      } else {
        persoanalDetailsList.clear();
      }
    } catch (e) {
      print(e);
    } finally {
      isLoader = false;
      notifyListeners();
    }
  }
}
