import 'package:evently/core/theme/appImages.dart';
import 'package:evently/core/theme/appTexts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 64,
          left: 16,
          right: 16,
          bottom: 16,
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                Appimages.eventlyLogo,
                width: 142.w,
                color: theme.primaryColor,
              ),
            ),
          Apptexts.l
          ],
        ),
      ),
    );
  }
}
