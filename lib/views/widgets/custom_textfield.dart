import 'package:flutter/material.dart';

Widget fancyTextFormField({
  required String hintText,
  required IconData icon,
  required TextEditingController controller,
  required String? Function(String?) validator, // 👈 validation callback
  bool obscureText = false,
  Widget? suffixIcon,
}) {
  const fieldHeight = 50.0;

  return Stack(
    clipBehavior: Clip.none,
    children: [
      // TextFormField container
      Container(
        margin: const EdgeInsets.only(left: fieldHeight / 2),
        height: fieldHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(30, 20, 20, 20),
              blurRadius: 10,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: fieldHeight / 2 + 20, right: 16),
          child: Center(
            child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              validator: validator, // 👈 used here
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                suffixIcon: suffixIcon,
              ),
            ),
          ),
        ),
      ),

      // Icon container
      Positioned(
        top: 0,
        left: 0,
        child: Container(
          height: fieldHeight,
          width: fieldHeight,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(60, 0, 0, 0),
                blurRadius: 16,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Center(
            child: Icon(icon, size: 24, color: Colors.black87),
          ),
        ),
      ),
    ],
  );
}
