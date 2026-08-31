import 'package:evently/core/theme/appImages.dart';
import 'package:evently/core/theme/appTexts.dart';
import 'package:evently/modules/authentication/screens/loginScreen.dart';
import 'package:evently/modules/authentication/widgets/customGooglButton.dart';
import 'package:evently/modules/authentication/widgets/customRow.dart';
import 'package:evently/modules/authentication/widgets/customtextfield.dart';
import 'package:evently/modules/home/screens/homeScreen.dart';
import 'package:evently/providers/authProvider.dart';
import 'package:evently/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passController = TextEditingController();
  TextEditingController? passConfController = TextEditingController();

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
          child: SingleChildScrollView(
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
                Text(Apptexts.createMain, style: theme.textTheme.headlineLarge),
                SizedBox(height: 24.h),
                Customtextfield(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value!.trim().isEmpty) {
                      return Apptexts.errorMessage;
                    }
                    return null;
                  },
                  prefixIcon: Icon(Icons.person_sharp),
                  hintText: Apptexts.nameHintText,
                ),
                SizedBox(height: 16.h),
                Customtextfield(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value!.trim().isEmpty) {
                      return Apptexts.errorMessage;
                    } else if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value.trim())) {
                      return Apptexts.mailErrorMessage;
                    }
                    return null;
                  },
                  prefixIcon: Icon(Icons.email_rounded),
                  hintText: Apptexts.emailHintText,
                ),
                SizedBox(height: 16.h),
                Customtextfield(
                  controller: passController,
                  validator: (value) {
                    if (value == null || value!.trim().isEmpty) {
                      return Apptexts.errorMessage;
                    } else if (!RegExp(
                      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
                    ).hasMatch(value.trim())) {
                      return Apptexts.passErrorMessage;
                    }
                    return null;
                  },
                  prefixIcon: Icon(Icons.lock),
                  hintText: Apptexts.passHintText,
                ),
                SizedBox(height: 16.h),
                Customtextfield(
                  controller: passConfController,
                  validator: (value) {
                    if (value == null || value!.trim().isEmpty) {
                      return Apptexts.errorMessage;
                    } else if (passConfController?.text !=
                        passController?.text) {
                      return Apptexts.passconfErrorMessage;
                    }
                    return null;
                  },
                  prefixIcon: Icon(Icons.lock),
                  hintText: Apptexts.confirmHintText,
                ),
                SizedBox(height: 24.h),
                Custombutton(
                  onPressed: () async {
                    if (formstate.currentState!.validate()) {
                      final result = await context.read<AuthProvider>().signUp(
                        email: emailController!.text.trim(),
                        password: passController!.text,
                      );

                      if (result) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Failed to create account'),
                          ),
                        );
                      }
                    }
                    ;
                  },
                  text: Apptexts.signuoButton,
                ),
                SizedBox(height: 24.h),
                CustomRow(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  text: Apptexts.haveAcc,
                  textbutton: Apptexts.loginButton,
                ),

                SizedBox(height: 24.h),
                CustomGooglButton(
                  onPressed: () async {
                    final result = await context
                        .read<AuthProvider>()
                        .signInWithGoogle();

                    if (result) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Google Sign Up failed')),
                      );
                    }
                  },

                  text: Apptexts.signGoogleButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
