// ignore_for_file: prefer_final_fields, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/pages/home.dart';
import 'package:grocery_store/pages/onboarding_screen.dart';
import 'package:grocery_store/pages/sign_up_screen.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/util/routes.dart';
import 'package:grocery_store/widgets/custom_text_field.dart';
import 'package:grocery_store/widgets/text_button.dart';
import 'package:sizer/sizer.dart';

import '../util/utils.dart';
import '../widgets/custom_textform_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(
            8.w,
            20.w,
            8.w,
            8.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/Group.png',
                    height: 30.w,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  kLoginScreenText,
                  style: kSemibold18,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(kLoginScreenText1, style: kRegular12),
                SizedBox(height: 5.h),
                CustomTextFormField(
                  hintText: 'Enter your email',
                  label: 'Email',
                  controller: _emailController,
                  obScure: false,
                  inputType: true,
                  icon: false,
                ),
                SizedBox(height: 5.h),
                CustomTextField(
                    hintText: 'Enter your Password',
                    icon: true,
                    label: 'Password',
                    controller: _passwordController,
                    obScure: true),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    kForgetPassword,
                  ),
                ),
                SizedBox(height: 2.h),
                CustomTextButton(
                  text: 'Log in',
                  onPressed: () {
                    signIn();
                    // Navigator.pushNamed(context, 'HomePage');
                  },
                ),
                SizedBox(
                  height: 3.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      },
                      child: Text('Sign in'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // print('object');
      Navigator.pushNamed(context, 'HomePage');

      // Navigator.pushNamed(context, HomePage());
      // newScreen(newScreen: HomePage(), context: context)
      // await navi.newScreen(
      //   context: context,
      //   newScreen: () {
      //     HomePage();
      //   },
      // );
    } on FirebaseAuthException catch (error) {
      print(error);
      print(context);
      // print('obje2222ct');
      Utils.showSnackBar(error.message);
    }
    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
