import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/pages/home.dart';
import 'package:grocery_store/pages/auth/login_screen.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/widgets/custom_text_field.dart';
import 'package:grocery_store/widgets/text_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sizer/sizer.dart';

import '../../util/routes.dart';
import '../../util/utils.dart';
import '../../widgets/custom_textform_field.dart';
import '../profile/get_profile_information_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // void profileInformationScreen() {
  //   Navigator.pushNamed(context, RouteNames.profileInformationScreen.route);
  // }

  Utils utils = Utils();
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  // final bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          8.w,
          15.w,
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
              SizedBox(height: 2.h),
              Text(
                kSignUpText,
                style: kSemibold18,
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(kSignUpText1, style: kRegular12),
              SizedBox(height: 3.h),
              // CustomTextField(
              //   hintText: 'Enter your username',
              //   label: 'Username',
              //   controller: _usernameController,
              //   obScure: false,
              //   icon: false,
              // ),
              SizedBox(height: 2.h),
              CustomTextFormField(
                hintText: 'Enter your email',
                label: 'Email',
                controller: _emailController,
                obScure: false,
                inputType: true,
                icon: false,
              ),
              SizedBox(height: 2.h),
              CustomTextField(
                  hintText: 'Enter your Password',
                  icon: true,
                  label: 'Password',
                  controller: _passwordController,
                  obScure: true),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('By continuing you agree to our'),
                  Flexible(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Terms of Service and Privacy Policy',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              CustomTextButton(
                  text: 'Sign Up',
                  onPressed: () {
                    print(_emailController.text);
                    print(_passwordController.text);
                    print(_usernameController.text);
                    signUp();
                  }),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: const Text(
                      'Sign in',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future signUp() async {
  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: _emailController.text.trim(),
  //       password: _passwordController.text.trim(),
  //     );
  //     // profileInformationScreen();
  //     Navigator.pushNamed(context, 'ProfileInformationScreen');
  //   } on FirebaseAuthException catch (error) {
  //     print(error);

  //     Utils.showSnackBar(error.message);
  //   }
  //   // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  // }
  Future signUp() async {
    try {
      // Creating user with Firebase Authentication
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Get the user ID from the created user
      String userId = userCredential.user!.uid;

      // Set up data to be saved in Firestore (customize as needed)
      Map<String, dynamic> userData = {
        "email": _emailController.text.trim(),
        // Add any additional fields you want to store, like "displayName", "createdAt", etc.
      };

      // Store the user data in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set(userData);

      // Navigate to ProfileInformationScreen
      Navigator.pushNamed(context, 'ProfileInformationScreen');
    } on FirebaseAuthException catch (error) {
      print(error);
      Utils.showSnackBar(error
          .message); // Assuming Utils is a utility class you have for showing snack bars
    } catch (e) {
      // Handle any other errors
      print(e);
      Utils.showSnackBar(e.toString());
    }
  }
}
