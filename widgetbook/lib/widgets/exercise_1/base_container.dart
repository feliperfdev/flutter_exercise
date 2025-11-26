import 'package:flutter/material.dart';

import '../../core/app_theme.dart';

class BaseContainer extends StatelessWidget {
  final Widget child;
  final Color shadowGlowColor;
  final Color? backgroundColor;

  const BaseContainer({
    super.key,
    required this.child,
    required this.shadowGlowColor,
    this.backgroundColor = AppTheme.cardBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      width: size.width,
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: shadowGlowColor.withValues(alpha: .3),
            offset: const Offset(0, 10),
            blurRadius: 20,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: shadowGlowColor.withValues(alpha: .5),
            offset: const Offset(0, 1),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}
