import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripy_ev_stable/config.dart';

class PixelPerfectWidgetBinding extends StatelessWidget {
  const PixelPerfectWidgetBinding({
    super.key,
    required this.app,
  });
  final Widget app;
  @override
  Widget build(BuildContext context) {
    // if (MediaQuery.of(context).size.width > 600) {
    //   return app;
    // }
    return ScreenUtilInit(
      designSize: Size(
        Config().get.FigmaWidth,
        Config().get.FigmaHeight,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      child: app,
    );
  }
}
