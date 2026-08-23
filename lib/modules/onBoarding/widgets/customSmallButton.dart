import 'package:evently/core/theme/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customsmallbutton extends StatelessWidget {
  Customsmallbutton({super.key, required this.onTap, required this.child});
  void Function()? onTap;
  Widget? child;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          height: 32.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: BoxBorder.all(
              color: theme.brightness == Brightness.light
                  ? Appcolors.lightStrokeColor
                  : Appcolors.darkStrokeColor,
            ),
            color: theme.brightness == Brightness.light
                ? Appcolors.whiteColor
                : Appcolors.darkSmallButtonColor,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: child,
          ),
        ),
      ),
    );
  }
}
