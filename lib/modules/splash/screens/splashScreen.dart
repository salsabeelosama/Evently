import 'package:animate_do/animate_do.dart';
import 'package:evently/core/theme/appImages.dart';
import 'package:evently/modules/start/screens/startScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 164.h),
            Expanded(
              child: ZoomIn(
                duration: const Duration(seconds: 2),
                child: Hero(
                  tag: "logo",
                  child: Image.asset(
                    Appimages.eventlyLogo,
                    color: theme.primaryColor,
                  ),
                ),
              ),
            ),
            FadeInUp(
              delay: const Duration(seconds: 2),
              onFinish: (direction) {
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Startscreen(),
                    ),
                  );
                });
              },
              child: Image.asset(
                Appimages.routeLogo,
                width: 240.w,
                height: 214.h,
                color: theme.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
