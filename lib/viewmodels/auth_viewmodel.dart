import 'package:flutter/material.dart';
import 'package:peopletrack/core/services/auth_services.dart';
import 'package:peopletrack/core/utils/storage.dart';
import 'package:peopletrack/routes/app_routes.dart';
import 'package:peopletrack/views/widgets/error_snackbar.dart';
import 'package:peopletrack/views/widgets/success_snackbar.dart';

class AuthViewmodel extends ChangeNotifier {
  bool isChecked = false;
  bool isLoading = false;
  bool checkingIsLoggedIn = false;
  SecureStorageService secureStorage = SecureStorageService();

  Future<void> isLogin() async {
    checkingIsLoggedIn = true;
    notifyListeners();
  }

  Future<void> checkLoginStatus() async {
    String? token = await secureStorage.getToken();
    checkingIsLoggedIn = token != null;
    notifyListeners();
  }

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
        await isLogin();

        if (context.mounted) {
          showSuccessMessage(context, "You're in! Have a great time");
          Navigator.pushReplacementNamed(context, AppRoutes.personalDetails);
        }
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
