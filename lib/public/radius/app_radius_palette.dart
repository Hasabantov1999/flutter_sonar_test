import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRadiusPalette {
  static BorderRadiusGeometry get borderRadius19 => BorderRadius.circular(19.r);
  static BorderRadiusGeometry get buttonRadius4 => BorderRadius.circular(4.r);
  static BorderRadiusGeometry get modalRadius => BorderRadius.only(
        topLeft: Radius.circular(14.r),
        topRight: Radius.circular(14.r),
      );
}
