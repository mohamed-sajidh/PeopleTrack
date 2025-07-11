import 'package:flutter/material.dart';
import 'package:peopletrack/routes/app_routes.dart';
import 'package:peopletrack/views/auth/login_screen.dart';
import 'package:peopletrack/views/launcher_page.dart';
import 'package:peopletrack/views/personal_details/personal_details_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.launcher:
        return MaterialPageRoute(builder: (_) => const LauncherPage());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.personalDetails:
        return MaterialPageRoute(builder: (_) => const PersonalDetailsPage());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No Route Defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
