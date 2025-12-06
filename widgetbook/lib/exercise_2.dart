import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'core/app_assets.dart';
import 'widgets/exercise_2/animated_footer.dart';
import 'widgets/exercise_2/blur_overlay.dart';
import 'widgets/exercise_2/landing_page_header_container.dart';

@widgetbook.UseCase(name: 'Default', type: Exercise2)
Widget buildExercise2(BuildContext context) {
  return const Exercise2();
}

class Exercise2 extends StatefulWidget {
  const Exercise2({super.key});

  @override
  State<Exercise2> createState() => _Exercise2State();
}

class _Exercise2State extends State<Exercise2> with TickerProviderStateMixin {
  final scroll = ScrollController();

  bool _isFooterVisible = false;

  late final AnimationController animationController;

  final tween = Tween<double>(begin: -90, end: 20);

  void scrollListener() {
    if (scroll.position.pixels >= scroll.position.minScrollExtent + 100) {
      if (!_isFooterVisible) {
        animationController.forward();
        _isFooterVisible = true;
      }
    } else if (_isFooterVisible) {
      animationController.reverse();
      _isFooterVisible = false;
    }
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    scroll.addListener(scrollListener);

    super.initState();
  }

  @override
  void dispose() {
    scroll.removeListener(scrollListener);
    scroll.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scroll,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Text(
                  "Here 's your landing page:",
                  style: textTheme.titleMedium,
                ),
                LandingPageHeaderContainer(
                  websiteAsset: AppAssets.ffWebsite,
                  htmlAsset: AppAssets.htmlIcon,
                  title: 'Form&Fun Landing Page',
                  subtitle: 'HTML',
                ),
                Text(
                  '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras at odio quam. Etiam sed lorem id ligula egestas ornare non ac mauris. Proin non sagittis justo. Sed id viverra est. Integer enim sem, scelerisque vitae tristique sit amet, ullamcorper vel arcu. Nullam mollis posuere turpis, ac dignissim quam sodales eget. Aenean congue fringilla pretium. Morbi volutpat fringilla luctus. Donec et ligula sit amet mauris sodales tristique a ac quam. Donec vel libero a libero laoreet eleifend a ut nisi. Donec ut sem in orci gravida mattis eget ut nibh. Ut faucibus sollicitudin magna, ac sollicitudin ex tristique at.
Pellentesque vehicula nisl et augue commodo, id bibendum urna tristique. Morbi in malesuada libero. Nullam rhoncus ex quis urna fringilla euismod vel imperdiet justo. Quisque condimentum cursus facilisis. Donec ex sem, efficitur sed sagittis ac, accumsan mattis libero. Pellentesque vulputate eget odio vel convallis. Proin malesuada pulvinar felis, sed lobortis sem porttitor ac. Vivamus molestie vehicula orci, efficitur rutrum nulla semper ac. Phasellus ut ligula tortor. In augue est, elementum a sodales eu, sodales id lectus. Sed ac luctus leo. Nullam a nulla pellentesque, scelerisque dolor in, mattis turpis.
      ''',
                  style: textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Stack(
            children: [
              const BlurOverlay(),
              AnimatedFooter(
                animationController: animationController,
                tween: tween,
                title: 'Form&Fun',
                subtitle: 'formandfun.co',
                logoAsset: AppAssets.ffLogo,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
