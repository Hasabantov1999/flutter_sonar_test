import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class IntroduceViewModel extends BaseViewModel {
  int index = 0;
  final PageController pageController = PageController();
  void nextPage() {
    index = index + 1;
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInCubic,
    );
  }

  void previousPage() {
    index = index - 1;
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInCubic,
    );
  }
}
