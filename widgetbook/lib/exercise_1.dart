import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'core/app_theme.dart';
import 'core/widget_constants.dart';
import 'widgets/exercise_1/base_container.dart';
import 'widgets/exercise_1/card_content.dart';
import 'widgets/exercise_1/loading_container.dart';

@widgetbook.UseCase(name: 'Default', type: Exercise1)
Widget buildExercise1(BuildContext context) {
  return const Exercise1();
}

class Exercise1 extends StatelessWidget {
  const Exercise1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: BaseContainer(
          shadowGlowColor: AppTheme.cardShadowGlowColor,
          child: BorderLoadingContainer(
            borderRadius: WidgetConstants.cardBorderRadius,
            borderColor: AppTheme.cardShadowGlowColor,
            strokeWidth: 2,
            child: CardContent(),
          ),
        ),
      ),
    );
  }
}
