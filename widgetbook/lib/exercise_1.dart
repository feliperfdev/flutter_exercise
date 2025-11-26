import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'core/app_assets.dart';
import 'core/app_theme.dart';
import 'widgets/exercise_1/base_container.dart';

@widgetbook.UseCase(name: 'Default', type: Exercise1)
Widget buildExercise1(BuildContext context) {
  return const Exercise1();
}

class Exercise1 extends StatelessWidget {
  const Exercise1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BaseContainer(
          shadowGlowColor: AppTheme.cardShadowGlowColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              Lottie.asset(
                AppAssets.lottieSearchingAnimation,
                height: 80,
                width: 80,
              ),
              const Text(
                'Loading File',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.darkColor,
                ),
              ),
              const Text(
                '1m 30s',
                style: TextStyle(fontSize: 12, color: AppTheme.tagLine),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
