import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/injection.dart';



import 'app_text.dart';

class AppTopAlert {
  static Future<void> show({
    required String? description,
    String? title,
  }) async {
    final bar = Flushbar(
      backgroundColor: Colors.white,
      borderRadius: BorderRadius.circular(10),
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.only(top: 20.h),
      boxShadows: kElevationToShadow[1],
      messageText: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            // SizedBox(
            //   width: 40,
            //   height: 40,
            //   child: Image.asset(
            //     Assets.images.leaf.path,
            //   ),
            // ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  AppText(
                    title,
                    width: 230.w,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                AppText(
                  description ?? "",
                  width: 230.w,
                  maxLines: 5,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      messageSize: router.initialKey.currentContext!.width - 40,
      flushbarPosition: FlushbarPosition.TOP,
      maxWidth: router.initialKey.currentContext!.width - 40,
      duration: const Duration(seconds: 3),
    );
    bar.show(
      router.initialKey.currentState!.context,
    );
  }
}
