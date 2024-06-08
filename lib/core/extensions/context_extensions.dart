import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
  EdgeInsetsGeometry get initialHorizantalPadding => EdgeInsets.symmetric(
        horizontal: 20.w,
      );

  double get contextModalHeight => height * 0.85;
  double get contextHalfModalHeight => height * 0.50;
}
