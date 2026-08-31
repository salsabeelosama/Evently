import 'package:evently/core/theme/appColors.dart';
import 'package:evently/core/theme/appImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGooglButton extends StatelessWidget {
  CustomGooglButton({super.key, required this.onPressed, required this.text});

  void Function()? onPressed;
  String text;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(double.infinity, 48.h),
          backgroundColor: theme.focusColor,
          side: BorderSide(color: theme.dividerColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Appimages.google, width: 24),
            SizedBox(width: 16.w),
            Text(
              text,
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
