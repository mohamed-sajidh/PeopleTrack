import 'package:flutter/material.dart';
import 'package:peopletrack/app/themes/app_colors.dart';

class PersonalStatusIcon extends StatelessWidget {
  const PersonalStatusIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 75,
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.green,
          width: 1.8,
        ),
      ),
      child: const Center(
        child: Text(
          "Active",
          style: TextStyle(
            color: AppColors.green,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
