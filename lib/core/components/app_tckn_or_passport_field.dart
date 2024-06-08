import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tripy_ev_stable/core/components/app_label_text_field.dart';
import 'package:tripy_ev_stable/utils/developer_log_utils.dart';

class AppTcknOrPassportNumberField extends StatefulWidget {
  const AppTcknOrPassportNumberField({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;
  @override
  State<AppTcknOrPassportNumberField> createState() =>
      _AppTcknOrPassportNumberFieldState();
}

class _AppTcknOrPassportNumberFieldState
    extends State<AppTcknOrPassportNumberField> {
  late TextEditingController controller;
  ValueNotifier<List<TextInputFormatter>?> formatters = ValueNotifier(null);
  bool isTc = true;
  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    super.initState();
  }

  void listenTextField(String text) {
    final passportRegex = RegExp(r'^[a-zA-Z]+$');
    final tcRegex = RegExp(r'^\d+$');
    controller.text = controller.text.toUpperCase();
    if (text.length > 1) {
      return;
    }
    if (text.isNotEmpty && passportRegex.hasMatch(text[0])) {
      DeveloperLog.instance.logSuccess("Pasaport Regexe Geçildi");

      if (isTc) {
        formatters.value = [
          MaskTextInputFormatter(
            mask: '@@-#######',
            filter: {
              "@": RegExp(r'^[a-zA-Z]+$'),
              "#": RegExp(r'[0-9]'),
            },
            type: MaskAutoCompletionType.lazy,
          ),
          LengthLimitingTextInputFormatter(10),
        ];
        controller.text = "";
      }
      isTc = false;
    } else if (text.isNotEmpty && tcRegex.hasMatch(text[0])) {
      DeveloperLog.instance.logSuccess("TC Regexe Geçildi");
      if (!isTc) {
        formatters.value = [
          MaskTextInputFormatter(
            mask: '###########',
            filter: {
              "#": RegExp(r'[0-9]'),
            },
            type: MaskAutoCompletionType.lazy,
          ),
          LengthLimitingTextInputFormatter(11),
        ];
        controller.text = "";
      }
      isTc = true;
    } else {
      formatters.value = null;
    }
  }

  @override
  void didUpdateWidget(covariant AppTcknOrPassportNumberField oldWidget) {
    controller = widget.controller ?? TextEditingController();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: formatters,
      builder: (context, frmtrs, child) {
        return AppLabelTextField(
          controller: controller,
          onChanged: (text) => listenTextField(text),
          label: "TCKN veya Pasaport Numarası",
          hint: "11111111111 | UU-1234567",
          inputFormatters: frmtrs,
        );
      },
    );
  }
}
