extension StringX on String {
  /// Calculate the reading time
  int calculateReadingTime() {
    final int wordCount = split(RegExp(r'\s+')).length;
    final double readingTime = wordCount / 225;
    return readingTime.ceil();
  }
}
