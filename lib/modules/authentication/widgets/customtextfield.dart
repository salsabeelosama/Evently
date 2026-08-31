import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customtextfield extends StatelessWidget {
  Customtextfield({
    super.key,
    required this.validator,
    required this.prefixIcon,
    required this.hintText,
    required this.controller
  });

  String? Function(String?) validator;
  Widget? prefixIcon;
  String? hintText;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: theme.focusColor,
        focusColor: theme.focusColor,
        prefixIcon: prefixIcon,
        prefixIconColor: theme.textTheme.titleMedium!.color,
        hintText: hintText,
        hintStyle: theme.textTheme.titleMedium!.copyWith(fontSize: 14.sp),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.dividerColor, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.dividerColor, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
      ),
    );
  }
}
