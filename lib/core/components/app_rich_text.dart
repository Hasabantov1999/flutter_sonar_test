import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tripy_ev_stable/config.dart';
import 'package:tripy_ev_stable/services/local_cache_service.dart';
import 'package:tripy_ev_stable/utils/developer_error_log_utils.dart';

class AppRichText extends StatefulWidget {
  const AppRichText({
    super.key,
    required this.jsonKey,
    this.activeStyle,
    this.passiveStyle,
    this.customStyle,
    this.recognizers,
    this.filter,
  });
  final String jsonKey;
  final TextStyle? activeStyle;
  final TextStyle? passiveStyle;
  final Map<String, TextStyle>? customStyle;
  final Map<String, VoidCallback>? recognizers;
  final Map<String, String>? filter;
  @override
  State<AppRichText> createState() => _AppRichTextState();
}

class _AppRichTextState extends State<AppRichText> {
  late List<InlineSpan> spans;
  bool isInitialized = false;
  @override
  void initState() {
    initalize();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppRichText oldWidget) {
    spans.clear();
    initalize();
    super.didUpdateWidget(oldWidget);
  }

  void initalize() async {
    spans = [];
    try {
      var data = await rootBundle.loadString(
          "${Config().get.languagePath}/${LocalCacheService().get.model().locale ?? "tr"}.json");

      var jsonData = json.decode(data);
      Map<String, dynamic> interpolation = jsonData[widget.jsonKey];
      interpolation.forEach(
        (interpolationKey, interPolationValue) {
          if (interPolationValue["slug"] == "true") {
            if (widget.filter != null) {
              String text = interPolationValue["text"];

              widget.filter?.forEach(
                (filterKey, filterValue) {
                  if (text.contains(filterKey)) {
                    text = text.replaceAll(
                      filterKey,
                      widget.filter![filterKey] ?? "",
                    );
                  }
                },
              );

              spans.add(
                TextSpan(
                  text: text,
                  style: widget.customStyle?[interpolationKey] ??
                      widget.activeStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.recognizers?[interpolationKey],
                ),
              );
            } else {
              String text = interPolationValue["text"];
              spans.add(
                TextSpan(
                  text: text,
                  style: widget.customStyle?[interpolationKey] ??
                      widget.activeStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.recognizers?[interpolationKey],
                ),
              );
            }
          } else {
            if (widget.filter != null) {
              String text = interPolationValue["text"];

              widget.filter?.forEach(
                (filterKey, filterValue) {
                  if (text.contains(filterKey)) {
                    text = text.replaceAll(
                      filterKey,
                      widget.filter![filterKey] ?? "",
                    );
                  }
                },
              );

              spans.add(
                TextSpan(
                  text: text,
                  style: widget.customStyle?[interpolationKey] ??
                      widget.passiveStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.recognizers?[interpolationKey],
                ),
              );
            } else {
              String text = interPolationValue["text"];
              spans.add(
                TextSpan(
                  text: text,
                  style: widget.customStyle?[interpolationKey] ??
                      widget.passiveStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.recognizers?[interpolationKey],
                ),
              );
            }
          }
        },
      );
      isInitialized = true;
      notify();
    } catch (e, stackTrace) {
      DeveloperErrorLog.instance.logService(
        e,
        stackTrace,
        "CountryCode",
      );
    }
  }

  void notify() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return !isInitialized
        ? const SizedBox.shrink()
        : AutoSizeText.rich(
            TextSpan(
              children: spans,
            ),
          );
  }
}
