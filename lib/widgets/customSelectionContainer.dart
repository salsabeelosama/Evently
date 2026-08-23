import 'package:evently/core/theme/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customselectioncontainer extends StatelessWidget {
  Customselectioncontainer({
    super.key,
    this.text,
    this.icon,
    required this.isSelected,
    required this.onTap
  });

  String? text;
  String? icon;
  bool isSelected;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap:
          onTap,
        
        child: Container(
          height: 36.h,
          decoration: BoxDecoration(
            border: isSelected
                ? null
                : Border.all(color: Appcolors.lightStrokeColor, width: 0.3),
            borderRadius: BorderRadius.circular(8.r),
            color: isSelected ? theme.primaryColor : Appcolors.whiteColor,
          ),
          child: Center(
            child: text == null
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 16,
                    ),
                    child: ImageIcon(
                      AssetImage(icon!),
                      color: isSelected
                          ? Appcolors.whiteColor
                          : theme.primaryColor,
                      size: 24.sp,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.5,
                      horizontal: 16,
                    ),
                    child: Text(
                      text!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: isSelected
                            ? Appcolors.whiteColor
                            : theme.primaryColor,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
