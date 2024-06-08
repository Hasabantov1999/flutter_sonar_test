import 'package:flutter/material.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/color_palette.dart';

class DarkColors implements AppColors {
  @override
  Color get scaffoldBgColor => Colors.white;

  @override
  Color get borderGray => const Color(0xffD2D2D2);

  @override
  Color get primary => const Color(0xff9B7BF8);

  @override
  Color get whiteColor => Colors.white;

  @override
  Color get whiteTextColor => Colors.white;

  @override
  Color get passiveColor => const Color(0xffFFCDB5);

  @override
  Color get textBlackColor => const Color(0xff221F20);

  @override
  Color get textfieldHintColor => const Color(0xff221F20);

  @override
  Color get textfieldLabelColor => const Color(0xffBDBCBC);

  @override
  Color get iconColor => const Color(0xff221F20);

  @override
  Color get textPassiveColor => const Color(0xffBDBCBC);

  @override
  Color get navBarBackground => const Color(0xffFCFCFC);

  @override
  Color get navBarBorder => const Color(0xffE6E6E6);

  @override
  Color get dividerColor => const Color(0xffBDBCBC).withOpacity(0.35);

  @override
  Color get modalRedColor => const Color(0xffE64848);
}
