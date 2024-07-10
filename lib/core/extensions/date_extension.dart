extension DateTimeExtension on String {
  DateTime get ConvertStringToDate {
    List<String> parts = split("/");

    if (parts.length != 3) {
      return DateTime.now();
    }
    print(parts);
    return DateTime(
      int.parse(parts[2]),
      int.parse(parts[1]),
      int.parse(parts[0]),
    );
  }
}

extension DateTimeExtension2 on DateTime {
  String get ConvertBackendDate {
    return toIso8601String();
  }
}
