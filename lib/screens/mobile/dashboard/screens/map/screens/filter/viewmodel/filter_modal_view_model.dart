import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FilterModalViewModel extends BaseViewModel {
  ValueNotifier<String?> socketPower = ValueNotifier(null);
  ValueNotifier<String?> stationType = ValueNotifier(null);
  ValueNotifier<String?> socketType = ValueNotifier(null);
  final TextEditingController minTextController = TextEditingController();
  final TextEditingController maxTextController = TextEditingController();
  void init() {}
}
