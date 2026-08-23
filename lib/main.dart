import 'package:evently/core/appProvider/appProvider.dart';
import 'package:evently/core/theme/appColors.dart';
import 'package:evently/core/theme/appTheme.dart';
import 'package:evently/modules/splash/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return ChangeNotifierProvider(
          create: (context) => AppProvider(),
          builder: (context, child) {
            var provider = Provider.of<AppProvider>(context);
            return MaterialApp(
              themeMode: provider.themeMode,
              theme: Apptheme.light,
              darkTheme: Apptheme.dark,
              debugShowCheckedModeBanner: false,
              home: Splashscreen(),
            );
          },
        );
      },
    );
  }
}
