import 'package:flutter/material.dart';
import 'package:peopletrack/app/themes/app_assets.dart';
import 'package:peopletrack/app/themes/app_colors.dart';
import 'package:peopletrack/views/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  late TextEditingController emailIdTextcontroller;
  late TextEditingController passwordTextcontroller;

  @override
  void initState() {
    super.initState();
    emailIdTextcontroller = TextEditingController();
    passwordTextcontroller = TextEditingController();
  }

  @override
  void dispose() {
    emailIdTextcontroller.dispose();
    passwordTextcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 280,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      AppAssets.loginBgImg,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        Image.asset(
                          AppAssets.bee,
                          height: 60,
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "BEE CHEM",
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Welcome Back!",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 27,
                ),
              ),
              const Text(
                "Login to your account",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: fancyTextFormField(
                  hintText: "Email address",
                  icon: Icons.email_outlined,
                  controller: emailIdTextcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!value.contains('@')) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: fancyTextFormField(
                  hintText: "Password",
                  icon: Icons.lock_outline,
                  obscureText: !isPasswordVisible,
                  controller: passwordTextcontroller,
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Password is required'
                      : null,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
