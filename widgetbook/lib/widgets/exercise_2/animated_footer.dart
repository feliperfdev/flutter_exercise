import 'package:flutter/material.dart';

class AnimatedFooter extends StatelessWidget {
  final AnimationController animationController;
  final Tween<double> tween;
  final String title;
  final String subtitle;
  final String logoAsset;

  const AnimatedFooter({
    super.key,
    required this.animationController,
    required this.tween,
    required this.title,
    required this.subtitle,
    required this.logoAsset,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        final value = tween.evaluate(animationController);

        return Positioned(
          bottom: value,
          left: 15,
          right: 15,
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(logoAsset),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: textTheme.bodyMedium),
                    Text(subtitle, style: textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
