// ignore_for_file: non_constant_identifier_names

extension IntExtensions on int {
  String get VisibleString {
    int minutes = this ~/ 60;
    int remainingSecondsInMinute = this % 60;

    return "${minutes.toString().length == 1 ? ("0$minutes") : minutes}:${remainingSecondsInMinute.toString().length == 1 ? ("0$remainingSecondsInMinute") : remainingSecondsInMinute}";
  }
}
