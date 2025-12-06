import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/app_theme.dart';
import '../../core/widget_constants.dart';

class LandingPageHeaderContainer extends StatelessWidget {
  final Color? backgroundColor;
  final String title;
  final String subtitle;
  final String websiteAsset;
  final String htmlAsset;
  final double websiteImageAspectRatio;
  final String buttonLabel;
  final double borderRadius;
  final Color buttonBackgroundColor;

  const LandingPageHeaderContainer({
    super.key,
    this.backgroundColor = AppTheme.cardBackgroundColor,
    required this.title,
    required this.subtitle,
    required this.websiteAsset,
    required this.htmlAsset,
    this.websiteImageAspectRatio = 16 / 9,
    this.buttonLabel = 'View',
    this.borderRadius = WidgetConstants.cardBorderRadius,
    this.buttonBackgroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 8,
              right: 8,
              bottom: 24,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: AspectRatio(
                aspectRatio: websiteImageAspectRatio,
                child: Image.asset(websiteAsset, fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 12,
              children: [
                Row(
                  spacing: 12,
                  children: [
                    SvgPicture.asset(htmlAsset),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: textTheme.bodyMedium),
                        Text(subtitle, style: textTheme.bodySmall),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      buttonBackgroundColor,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(buttonLabel, style: textTheme.labelMedium),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
