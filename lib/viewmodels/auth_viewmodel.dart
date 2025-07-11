import 'package:flutter/material.dart';
import 'package:peopletrack/core/services/auth_services.dart';
import 'package:peopletrack/routes/app_routes.dart';
import 'package:peopletrack/views/widgets/error_snackbar.dart';
import 'package:peopletrack/views/widgets/success_snackbar.dart';

class AuthViewmodel extends ChangeNotifier {
  bool isChecked = false;
  bool isLoading = false;

  void changeCheckedbox() {
    isChecked = !isChecked;
    notifyListeners();
  }

  Future<void> userLogin(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      isLoading = true;
      notifyListeners();

      String? response = await AuthServices.userLogin(email, password, context);

      if (response == null) {
        if (!context.mounted) return;

        showSuccessMessage(context, "You're in! Have a great time");

        Navigator.pushReplacementNamed(context, AppRoutes.personalDetails);
      } else {
        if (!context.mounted) return;
        showOverlayError(context, response);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
