import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tripy_ev_stable/core/components/app_button.dart';
import 'package:tripy_ev_stable/core/components/app_label_text_field.dart';
import 'package:tripy_ev_stable/core/components/app_loading_bar.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/schemas/local/app_country_schema/app_country_schema.dart';
import 'package:tripy_ev_stable/utils/developer_error_log_utils.dart';

List<AppCountrySchema> _countrys = [];

class AppPhonePickerField extends StatefulWidget {
  const AppPhonePickerField({super.key});

  @override
  State<AppPhonePickerField> createState() => _AppPhonePickerFieldState();
}

class _AppPhonePickerFieldState extends State<AppPhonePickerField> {
  late AppCountrySchema country;
  bool isInitialized = false;
  @override
  void initState() {
    initialize().then(
      (value) => findTurkey(),
    );
    super.initState();
  }

  Future<void> initialize() async {
    if (_countrys.isNotEmpty) {
      return;
    }
    try {
      var data = await rootBundle.loadString("assets/jsons/country_code.json");

      var jsonData = json.decode(data);
      jsonData.forEach(
        (country) {
          _countrys.add(
            AppCountrySchema.fromJson(country),
          );
        },
      );
    } catch (e, stackTrace) {
      DeveloperErrorLog.instance.logService(
        e,
        stackTrace,
        "CountryCode",
      );
    }
  }

  @override
  void didUpdateWidget(covariant AppPhonePickerField oldWidget) {
    initialize().then(
      (value) => findTurkey(),
    );
    super.didUpdateWidget(oldWidget);
  }

  void notify() {
    if (mounted) {
      setState(() {});
    }
  }

  void findTurkey() {
    for (var country in _countrys) {
      if (country.callingCode == "+90") {
        this.country = country;
        isInitialized = true;
        notify();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppLabelTextField(
      label: "Telefon Numaranız",
      hint: "(555)-555-55-55",
      inputFormatters: [
        MaskTextInputFormatter(
          mask: '(###) ###-##-##',
          filter: {"#": RegExp(r'[0-9]')},
          type: MaskAutoCompletionType.lazy,
        ),
      ],
      prefixIconConstraints: BoxConstraints(
        maxWidth: 50.w,
      ),
      prefix: !isInitialized
          ? const SizedBox(
              width: 45,
              height: 45,
              child: FractionallySizedBox(
                widthFactor: 0.4,
                heightFactor: 0.4,
                child: AppLoadingBar(),
              ),
            )
          : CupertinoButton(
              onPressed: () async {
                FocusScope.of(context).unfocus();
                final res = await router.modalPush(
                  _CountryPicker(
                    initial: country,
                  ),
                );
                if (res is AppCountrySchema) {
                  country = res;
                  notify();
                }
              },
              padding: EdgeInsets.zero,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/${country.flag}",
                    width: 25.w,
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Expanded(
                    child: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: context.appThemeExtensions.colors.iconColor,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

class _CountryPicker extends StatefulWidget {
  const _CountryPicker({
    required this.initial,
  });
  final AppCountrySchema initial;
  @override
  State<_CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<_CountryPicker> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  List<AppCountrySchema> searcableList = [];

  void searchText() {
    searcableList = [];
    for (var element in _countrys) {
      if (element.name != null &&
          element.callingCode != null &&
          element.countryCode != null) {
        if (element.name!
                .toLowerCase()
                .contains(textController.text.toLowerCase()) ||
            element.callingCode!.contains(textController.text) ||
            element.countryCode!.contains(textController.text)) {
          searcableList.add(element);
        }
      }
    }
    setState(() {});
  }

  Future<void> loadData() async {
    searcableList = _countrys;
  }

  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.contextModalHeight,
      width: context.width,
      child: Material(
        color: context.appThemeExtensions.colors.scaffoldBgColor,
        borderRadius: AppRadiusPalette.modalRadius,
        child: Padding(
          padding: context.initialHorizantalPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 13.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(
                    onPressed: () async {
                      router.pop();
                    },
                    width: 80.w,
                    backgroundColor: Colors.transparent,
                    child: AppText(
                      "VAZGEÇ",
                      style: TextStyle(
                        color: context.appThemeExtensions.colors.primary,
                      ),
                    ),
                  ),
                  // AppButton(
                  //   onPressed: () async {},
                  //   width: 80.w,
                  //   backgroundColor: Colors.transparent,
                  //   child: AppText(
                  //     "ONAYLA",
                  //     style: TextStyle(
                  //       color: context.appThemeExtensions.colors.primary,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 13.h,
              ),
              AppLabelTextField(
                label: "Ülkeler içinde ara",
                controller: textController,
                onChanged: (text) {
                  searchText();
                },
              ),
              Expanded(
                child: Scrollbar(
                  child: ListView.builder(
                      itemCount: searcableList.length,
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      clipBehavior: Clip.hardEdge,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        try {
                          return ListTile(
                            selected: searcableList[index].callingCode ==
                                    widget.initial.callingCode
                                ? true
                                : false,
                            selectedColor:
                                context.appThemeExtensions.colors.primary,
                            onTap: () {
                              router.pop<AppCountrySchema?>(
                                result: searcableList[index],
                              );
                            },
                            leading: SvgPicture.asset(
                              'assets/${searcableList[index].flag}',
                              width: 25,
                              height: 25,
                            ),
                            minLeadingWidth: 25,
                            title: Row(
                              children: [
                                Text(
                                  searcableList[index].callingCode ?? "",
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  searcableList[index].name ?? "",
                                ),
                              ],
                            ),
                          );
                        } catch (e) {
                          return Container();
                        }
                      })),
                ),
              ),
              SizedBox(
                height: MediaQuery.paddingOf(context).bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
