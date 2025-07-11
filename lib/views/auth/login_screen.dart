import 'package:flutter/material.dart';
import 'package:peopletrack/app/themes/app_assets.dart';
import 'package:peopletrack/app/themes/app_colors.dart';
import 'package:peopletrack/viewmodels/auth_viewmodel.dart';
import 'package:peopletrack/views/widgets/custom_button.dart';
import 'package:peopletrack/views/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

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
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Consumer<AuthViewmodel>(
                          builder: (context, provider, child) {
                            return Checkbox(
                              value: provider.isChecked,
                              onChanged: (bool? value) {
                                provider.changeCheckedbox();
                              },
                              activeColor: AppColors.primaryColor,
                            );
                          },
                        ),
                        const Text(
                          "Remember me",
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "FORGOT PASSWORD",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Consumer<AuthViewmodel>(
                  builder: (context, provider, child) {
                    return LoginButtonWidget(
                      text: "LOGIN",
                      onPressed: () {
                        if (provider.isChecked) {
                          provider.userLogin(
                            emailIdTextcontroller.text,
                            passwordTextcontroller.text,
                            context,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Please accept 'Remember me' to proceed."),
                              backgroundColor: AppColors.red,
                            ),
                          );
                        }
                      },
                      loading: provider.isLoading,
                      formKey: formKey,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.7,
                        color: AppColors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("OR"),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.7,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    "Register",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
