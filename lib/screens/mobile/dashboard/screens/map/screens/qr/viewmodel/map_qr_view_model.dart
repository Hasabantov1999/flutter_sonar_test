import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MapQrViewModel extends BaseViewModel {
  ValueNotifier<CrossFadeState> state = ValueNotifier(CrossFadeState.showFirst);
  ValueNotifier<bool> stateBusy = ValueNotifier(false);
  final PageController pageController = PageController();
  final TextEditingController textController = TextEditingController();
  void changePage() {
    if (state.value == CrossFadeState.showFirst) {
      state.value = CrossFadeState.showSecond;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linearToEaseOut,
      );
    } else {
      state.value = CrossFadeState.showFirst;
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linearToEaseOut,
      );
    }
  }

  Future<void> reSearch(String qr) async {
    if (stateBusy.value) {
      return;
    }
    stateBusy.value = true;
    await Future.delayed(const Duration(hours: 2));
    stateBusy.value = false;
  }
}
