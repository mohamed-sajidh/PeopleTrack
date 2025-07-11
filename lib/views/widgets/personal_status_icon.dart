import 'package:flutter/material.dart';
import 'package:peopletrack/app/themes/app_colors.dart';

class PersonalStatusIcon extends StatelessWidget {
  final int status;
  const PersonalStatusIcon({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 75,
      decoration: BoxDecoration(
        color: status == 1 ? AppColors.lightGreen : AppColors.lightRed,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: status == 1 ? AppColors.green : AppColors.red,
          width: 1.8,
        ),
      ),
      child: Center(
        child: Text(
          "Active",
          style: TextStyle(
            color: status == 1 ? AppColors.green : AppColors.red,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
