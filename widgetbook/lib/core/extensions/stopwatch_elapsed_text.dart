extension StopwatchElapsedText on Stopwatch {
  String get elapsedText => '${elapsed.inMinutes}m ${elapsed.inSeconds % 60}s';
}
