import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:peopletrack/app/themes/app_colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  final double size;
  const AppLoadingIndicator({super.key, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.discreteCircle(
      color: AppColors.white,
      size: size,
      secondRingColor: AppColors.black,
      thirdRingColor: AppColors.purple,
    );
  }
}
