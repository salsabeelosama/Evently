import 'package:evently/core/theme/appImages.dart';
import 'package:evently/core/theme/appTexts.dart';
import 'package:evently/modules/authentication/screens/signupScreen.dart';
import 'package:evently/modules/authentication/widgets/customGooglButton.dart';
import 'package:evently/modules/authentication/widgets/customRow.dart';
import 'package:evently/modules/authentication/widgets/customtextfield.dart';
import 'package:evently/modules/home/screens/homeScreen.dart';
import 'package:evently/providers/authProvider.dart';
import 'package:evently/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passController = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

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

        child: Form(
          key: formstate,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  Appimages.eventlyLogo,
                  width: 142.w,
                  color: theme.primaryColor,
                ),
              ),
              SizedBox(height: 48.h),
              Text(Apptexts.loginMain, style: theme.textTheme.headlineLarge),
              SizedBox(height: 24.h),
              Customtextfield(
                validator: (value) {
                  if (value == null || value!.trim().isEmpty) {
                    return Apptexts.errorMessage;
                  }
                  return null;
                },
                prefixIcon: Icon(Icons.email_rounded),
                hintText: Apptexts.emailHintText,
                controller: emailController,
              ),
              SizedBox(height: 16.h),
              Customtextfield(
                validator: (value) {
                  if (value == null || value!.trim().isEmpty) {
                    return Apptexts.errorMessage;
                  }
                  return null;
                },
                prefixIcon: Icon(Icons.lock),
                hintText: Apptexts.passHintText,
                controller: passController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      Apptexts.forgetButton,
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
              SizedBox(height: 38.h),
              Custombutton(
                onPressed: () async {
                  if (formstate.currentState != null &&
                      formstate.currentState!.validate()) {
                    final result = await context.read<AuthProvider>().signIn(
                      email: emailController!.text.trim(),
                      password: passController!.text,
                    );

                    if (result) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Email or password is incorrect'),
                        ),
                      );
                    }
                  }
                },
                text: Apptexts.loginButton,
              ),
              SizedBox(height: 32.h),
              CustomRow(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                text: Apptexts.dontHaveAcc,
                textbutton: Apptexts.signuoButton,
              ),
              SizedBox(height: 24.h),
              CustomGooglButton(
                onPressed: () async {
    final result =
        await context.read<AuthProvider>().signInWithGoogle();

    if (result) {
      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Google Sign In failed'),
        ),
      );
    }
  },
                text: Apptexts.loginGoogleButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
