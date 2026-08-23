import 'package:evently/core/appProvider/appProvider.dart';
import 'package:evently/core/theme/appImages.dart';
import 'package:evently/core/theme/appTexts.dart';
import 'package:evently/modules/onBoarding/onBoarding_screen.dart';
import 'package:evently/widgets/customButton.dart';
import 'package:evently/widgets/customSelectionContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Startscreen extends StatelessWidget {
  const Startscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<AppProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 64,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(
                  tag: "logo",
                  child: Image.asset(
                    Appimages.eventlyLogo,
                    width: 142.w,
                    color: theme.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Image.asset(
                Appimages.startImage,
                color: theme.textTheme.titleSmall!.color,
              ),
              SizedBox(height: 24.h),
              Text(Apptexts.startScreenMain, style: theme.textTheme.titleLarge),
              SizedBox(height: 8.h),
              Text(Apptexts.startScreenSub, style: theme.textTheme.titleMedium),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Text(Apptexts.lang, style: theme.textTheme.titleSmall),
                  Spacer(),
                  Customselectioncontainer(
                    text: Apptexts.eng,
                    isSelected: true,
                    onTap: () {},
                  ),
                  Customselectioncontainer(
                    text: Apptexts.ar,
                    isSelected: false,
                    onTap: () {},
                  ),
                ],
              ),

              Row(
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    Apptexts.theme,
                    style: theme.textTheme.titleSmall,
                  ),
                  Spacer(),
                  Customselectioncontainer(
                    icon: Appimages.sun,
                    isSelected: provider.themeMode == ThemeMode.light,
                    onTap: () {
                      provider.changeMode(ThemeMode.light);
                    },
                  ),
                  SizedBox(height: 8.h),
                  Customselectioncontainer(
                    icon: Appimages.moon,
                    isSelected: provider.themeMode == ThemeMode.dark,
                    onTap: () {
                      provider.changeMode(ThemeMode.dark);
                    },
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Custombutton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnboardingScreen(),
                    ),
                  );
                },
                text: Apptexts.startbutton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
