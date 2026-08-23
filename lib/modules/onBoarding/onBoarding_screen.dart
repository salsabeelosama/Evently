import 'package:dots_indicator/dots_indicator.dart';
import 'package:evently/core/theme/appColors.dart';
import 'package:evently/core/theme/appImages.dart';
import 'package:evently/core/theme/appTexts.dart';
import 'package:evently/modules/login/screens/loginScreen.dart';
import 'package:evently/modules/onBoarding/widgets/customSmallButton.dart';
import 'package:evently/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Map<String, String>> onboarding = const [
    {
      "mainText": Apptexts.onboardMAin1,
      "subText": Apptexts.onboardSub1,
      "image": Appimages.onboard1,
    },
    {
      "mainText": Apptexts.onboardMAin2,
      "subText": Apptexts.onboardSub2,
      "image": Appimages.onboard2,
    },
    {
      "mainText": Apptexts.onboardMAin3,
      "subText": Apptexts.onboardSub3,
      "image": Appimages.onboard3,
    },
  ];

  int currentIndex = 0;
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Customsmallbutton(
                    onTap: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: theme.brightness == Brightness.light
                          ? theme.primaryColor
                          : Appcolors.whiteColor,
                    ),
                  ),
                  Image.asset(
                    Appimages.eventlyLogo,
                    width: 142.w,
                    color: theme.primaryColor,
                  ),

                  Customsmallbutton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      Apptexts.skipButton,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        controller: pageController,
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        children: List.generate(
                          onboarding.length,
                          (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                onboarding[index]["image"]!,
                                color: theme.textTheme.titleSmall?.color,
                              ),
                              Center(
                                child: DotsIndicator(
                                  onTap: (position) {
                                    setState(() {
                                      currentIndex = position;
                                    });
                                    pageController.animateToPage(
                                      position,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  dotsCount: onboarding.length,
                                  position: currentIndex.toDouble(),
                                  decorator: DotsDecorator(
                                    activeColor: theme.primaryColor,

                                    size: const Size.square(9.0),
                                    activeSize: const Size(24.0, 9.0),
                                    activeShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Center(
                                  child: Text(
                                    onboarding[index]["mainText"]!,
                                    style: theme.textTheme.titleLarge,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  onboarding[index]["subText"]!,
                                  style: theme.textTheme.titleMedium,
                                ),
                              ),
                              SizedBox(height: 16.h),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Custombutton(
                onPressed: () {
                  if (currentIndex < onboarding.length - 1) {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  }
                },
                text: Apptexts.nextButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
