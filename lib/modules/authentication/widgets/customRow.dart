import 'package:evently/core/theme/appTexts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRow extends StatelessWidget {
  CustomRow({
    super.key,
    required this.onPressed,
    required this.text,
    required this.textbutton,
  });
  void Function()? onPressed;
  String text;
  String textbutton;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: theme.textTheme.titleMedium!.copyWith(fontSize: 14.sp),
            ),
            TextButton(
              onPressed:onPressed,
              child: Text(
                textbutton,
                style: theme.textTheme.titleMedium!.copyWith(
                  fontSize: 14.sp,
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationColor: theme.primaryColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(child: Divider(color: theme.dividerColor)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Apptexts.or,
                style: TextStyle(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            ),
            Expanded(child: Divider(color: theme.dividerColor)),
          ],
        ),
      ],
    );
  }
}
