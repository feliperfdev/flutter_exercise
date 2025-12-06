import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CardContent extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String lottieAsset;
  final double lottieAssetSize;

  const CardContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.lottieAsset,
    this.lottieAssetSize = 80,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          Lottie.asset(
            lottieAsset,
            height: lottieAssetSize,
            width: lottieAssetSize,
          ),
          Text(title, style: theme.textTheme.bodyMedium),
          if (subtitle != null)
            Text(subtitle!, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
