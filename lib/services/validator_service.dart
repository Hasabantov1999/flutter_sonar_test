import 'package:flutter/material.dart';

ValueNotifier<bool> AppValidateForm = ValueNotifier(false);
Map<String, dynamic> _keys = {};
void SetAppValidate({
  required String label,
  required bool validate,
}) {
  if (_keys[label] == null) {
    _keys.addAll(
      {
        label: {
          "label": label,
          "validate": validate,
        }
      },
    );
  } else {
    _keys[label] = {
      "label": label,
      "validate": validate,
    };
  }
  WidgetsBinding.instance.addPostFrameCallback(
    (callBack) {
      AppValidateForm.value = true;
    },
  );
  _keys.forEach(
    (key, value) {
      if (!value["validate"]) {
        WidgetsBinding.instance.addPostFrameCallback(
          (callBack) {
            AppValidateForm.value = false;
          },
        );
      }
    },
  );
}

void DisposeAppValidate({
  required List<String> labels,
}) {
  for (var key in labels) {
    WidgetsBinding.instance.addPostFrameCallback(
      (callBack) {
        AppValidateForm.value = false;
      },
    );
    _keys.remove(key);
  }
}
