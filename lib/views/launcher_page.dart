import 'package:flutter/material.dart';
import 'package:peopletrack/routes/app_routes.dart';
import 'package:peopletrack/viewmodels/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatefulWidget {
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final authProvider = Provider.of<AuthViewmodel>(context, listen: false);

      await authProvider.checkLoginStatus();
      final isLoggedIn = authProvider.checkingIsLoggedIn;

      if (!mounted) return;
      Navigator.pushReplacementNamed(
        context,
        isLoggedIn ? AppRoutes.personalDetails : AppRoutes.login,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
