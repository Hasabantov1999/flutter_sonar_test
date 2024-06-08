// ignore_for_file: non_constant_identifier_names

extension StringExtension on String {
  String get Purify {
    return replaceAll(" ", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll(
          "-",
          "",
        );
  }

  String get ClearSpaces {
    return replaceAll(" ", "");
  }
}
