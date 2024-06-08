import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tripy_ev_stable/services/localization_cache_service.dart';

import 'app_cache_builder.dart';

class AppText extends StatelessWidget {
  const AppText(this.data,
      {super.key,
      this.style,
      this.textAlign,
      this.maxLines,
      this.minFontSize,
      this.maxFontSize,
      this.width,
      this.textOverflow,
      this.isBackendTranslateMode = false,
      this.onTap,
      this.tag});
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final String data;
  final double? minFontSize;
  final double? maxFontSize;
  final double? width;
  final TextOverflow? textOverflow;
  final bool isBackendTranslateMode;
  final VoidCallback? onTap;
  final String? tag;
  @override
  Widget build(BuildContext context) {
    if (tag != null) {
      return Hero(tag: tag!, child: textWidget());
    }
    return textWidget();
  }

  Widget textWidget() => GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: width,
          child: AppCacheBuilder(
            builder: (context, cache, child) {
              return Material(
                type: MaterialType.transparency,
                child: FutureBuilder(
                  future: LocalizationServices.instance.translate(
                    data,
                    language: isBackendTranslateMode ? "en" : null,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return AutoSizeText(
                        snapshot.data!,
                        textAlign: textAlign,
                        style: style,
                        maxLines: maxLines ?? 100,
                        maxFontSize: maxFontSize ?? double.infinity,
                        minFontSize: minFontSize ?? 8,
                        overflow: textOverflow ?? TextOverflow.ellipsis,
                      );
                    }
                    return AutoSizeText(
                      data,
                      textAlign: textAlign,
                      style: style,
                      maxLines: maxLines,
                      maxFontSize: maxFontSize ?? double.infinity,
                      minFontSize: minFontSize ?? 8,
                      overflow: textOverflow ?? TextOverflow.ellipsis,
                    );
                  },
                ),
              );
            },
          ),
        ),
      );
}
