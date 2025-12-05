import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class BorderLoadingContainer extends StatefulWidget {
  final double strokeWidth;
  final double borderRadius;
  final Color borderColor;
  final Widget child;

  const BorderLoadingContainer({
    super.key,
    required this.strokeWidth,
    required this.borderRadius,
    required this.borderColor,
    required this.child,
  });

  @override
  State<BorderLoadingContainer> createState() => _BorderLoadingContainerState();
}

class _BorderLoadingContainerState extends State<BorderLoadingContainer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();

    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sliderValue = context.knobs.double.slider(
      label: 'progress',
      max: 100,
    );

    final useSlider = sliderValue > 1;

    return AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (context, child) => CustomPaint(
        painter: _BorderProgressPainter(
          useSlider: useSlider,
          progress: useSlider ? sliderValue : _animation.value,
          borderRadius: widget.borderRadius,
          strokeWidth: widget.strokeWidth,
          color: widget.borderColor,
        ),
        child: child,
      ),
    );
  }
}

final class _BorderProgressPainter extends CustomPainter {
  final double progress;
  final double borderRadius;
  final double strokeWidth;
  final Color color;
  final bool useSlider;

  _BorderProgressPainter({
    required this.progress,
    required this.borderRadius,
    required this.color,
    required this.strokeWidth,
    this.useSlider = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final rrect = RRect.fromRectAndRadius(
      rect.deflate(strokeWidth / 2),
      Radius.circular(borderRadius),
    );

    // Caminho completo da borda
    final path = Path()..addRRect(rrect);

    // Comprimento total da borda
    final metric = path.computeMetrics().first;
    final totalLength = metric.length;

    // Tamanho do segmento de loading
    final segmentLength = totalLength * (useSlider ? .1 : .25);

    // Ponto de partida
    final start = totalLength * progress * (useSlider ? .01 : 1);

    // Final do progresso
    final end = start + segmentLength;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    if (end <= totalLength) {
      final segment = metric.extractPath(start, end);
      canvas.drawPath(segment, paint);
    } else {
      final firstPart = metric.extractPath(start, totalLength);
      final secondPart = metric.extractPath(0, end - totalLength);

      canvas
        ..drawPath(firstPart, paint)
        ..drawPath(secondPart, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _BorderProgressPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.borderRadius != borderRadius ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.color != color;
}
