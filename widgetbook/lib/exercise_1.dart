import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/core/extensions/stopwatch_elapsed_text.dart';

import 'core/app_assets.dart';
import 'core/app_theme.dart';
import 'core/knobs_constants.dart';
import 'core/widget_constants.dart';
import 'widgets/exercise_1/base_container.dart';
import 'widgets/exercise_1/card_content.dart';
import 'widgets/exercise_1/loading_container.dart';

@widgetbook.UseCase(name: 'Default', type: Exercise1)
Widget buildExercise1(BuildContext context) {
  return const Exercise1();
}

class Exercise1 extends StatefulWidget {
  const Exercise1({super.key});

  @override
  State<Exercise1> createState() => _Exercise1State();
}

class _Exercise1State extends State<Exercise1> with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  final stopwatch = Stopwatch()..start();

  static const loadingDurationInSeconds = 5;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(
            vsync: this,
            duration: const Duration(seconds: loadingDurationInSeconds),
          )
          ..repeat()
          ..addListener(() => setState(() {}));

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sliderValue = context.knobs.double.slider(
      label: KnobsConstants.progressSliderLabel,
      max: KnobsConstants.progressSliderMaxValue,
    );

    return Scaffold(
      body: Center(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            controller
              ..reset()
              ..repeat();
            stopwatch.reset();
          },
          child: BaseContainer(
            shadowGlowColor: AppTheme.cardShadowGlowColor,
            child: BorderLoadingContainer(
              animation: animation,
              sliderValue: sliderValue,
              useSlider: sliderValue > 1,
              borderRadius: WidgetConstants.cardBorderRadius,
              borderColor: AppTheme.cardShadowGlowColor,
              strokeWidth: 2,
              child: CardContent(
                lottieAsset: AppAssets.lottieSearchingAnimation,
                title: 'Loading File',
                subtitle: !stopwatch.isRunning ? null : stopwatch.elapsedText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
