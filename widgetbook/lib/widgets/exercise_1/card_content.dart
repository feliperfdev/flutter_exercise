import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/app_assets.dart';

class CardContent extends StatelessWidget {
  const CardContent({super.key});

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
            AppAssets.lottieSearchingAnimation,
            height: 80,
            width: 80,
          ),
          Text('Loading File', style: theme.textTheme.bodyMedium),
          Text('1m 30s', style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
