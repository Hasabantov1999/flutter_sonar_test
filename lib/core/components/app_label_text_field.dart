import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/services/validator_service.dart';

class AppLabelTextField extends StatelessWidget {
  const AppLabelTextField({
    super.key,
    this.hint,
    required this.label,
    this.suffix,
    this.password = false,
    this.prefix,
    this.prefixIconConstraints,
    this.controller,
    this.onChanged,
    this.inputFormatters,
    this.validator,
    this.onEditingComplete,
    this.keyboardType,
    this.textInputAction,
    this.minLines,
    this.maxLines,
    this.validateLabel,
  });
  final String? hint;
  final String label;
  final Widget? suffix;
  final Widget? prefix;
  final BoxConstraints? prefixIconConstraints;
  final bool password;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final VoidCallback? onEditingComplete;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? minLines;
  final int? maxLines;
  final String? validateLabel;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> obscure = ValueNotifier(password);
    ValueNotifier<bool?> isValidate = ValueNotifier(null);
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: ValueListenableBuilder(
        valueListenable: obscure,
        builder: (context, passVal, child) {
          return ValueListenableBuilder(
              valueListenable: isValidate,
              builder: (context, valid, child) {
                return TextFormField(
                  controller: controller,
                  onChanged: onChanged,
                  cursorColor: context.appThemeExtensions.colors.primary,
                  inputFormatters: inputFormatters,
                  obscureText: passVal,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  onEditingComplete: onEditingComplete,
                  minLines: minLines,
                  maxLines: maxLines ?? 1,
                  validator: validator == null
                      ? null
                      : (val) {
                          if ((val?.length ?? 0) < 1) {
                            isValidate.value = null;
                            return null;
                          }
                          final res = validator!(val);
                          if (res == null) {
                            if (validateLabel != null) {
                              SetAppValidate(
                                label: validateLabel!,
                                validate: true,
                              );
                            }

                            isValidate.value = true;
                          } else {
                            if (validateLabel != null) {
                              SetAppValidate(
                                label: validateLabel!,
                                validate: false,
                              );
                            }
                            isValidate.value = false;
                          }
                          return res;
                        },
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textfieldHintColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    labelText: label,
                    labelStyle: TextStyle(
                      color:
                          context.appThemeExtensions.colors.textfieldHintColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    floatingLabelStyle: TextStyle(
                      color:
                          context.appThemeExtensions.colors.textfieldLabelColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    hintText: hint,
                    hintStyle: TextStyle(
                      color:
                          context.appThemeExtensions.colors.textfieldLabelColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: context.appThemeExtensions.colors.primary,
                        width: 1.5,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: context.appThemeExtensions.colors.primary,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: context.appThemeExtensions.colors.primary,
                        width: 1.5,
                      ),
                    ),
                    prefixIcon: prefix,
                    prefixIconConstraints: prefixIconConstraints,
                    suffixIcon: password
                        ? InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () {
                              obscure.value = !obscure.value;
                            },
                            child: Icon(
                              passVal
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color:
                                  context.appThemeExtensions.colors.iconColor,
                            ),
                          )
                        : (suffix ??
                            ((valid != null && valid)
                                ? FadeIn(
                                    duration: const Duration(milliseconds: 300),
                                    child: const Icon(
                                      Icons.done,
                                      color: Colors.green,
                                    ),
                                  )
                                : (valid != null && !valid)
                                    ? FadeIn(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        ),
                                      )
                                    : null)),
                  ),
                );
              });
        },
      ),
    );
  }
}
