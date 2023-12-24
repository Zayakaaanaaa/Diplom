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

import '../../util/user.dart';
import '../../util/utils.dart';
import '../../widgets/custom_textform_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Utils utils = Utils();
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();

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
            CustomTextField(
              hintText: 'цахим хаягаа бичнэ үү',
              label: 'Цахим шуудан',
              controller: _emailController,
              obScure: false,
              inputType: false,
              icon: false,
            ),
            SizedBox(height: 2.h),
            CustomTextField(
                hintText: 'нууц үгээ оруулна уу',
                icon: true,
                label: 'Нууц үг',
                controller: _passwordController,
                obScure: true),
            SizedBox(height: 2.h),
            CustomTextField(
                hintText: 'нууц үгээ давтан оруулна уу',
                icon: true,
                label: 'Нууц үг давтах',
                controller: _repasswordController,
                obScure: true),
            SizedBox(height: 5.h),
            CustomTextButton(
                text: 'Бүртгүүлэх',
                onPressed: () {
                  print(_emailController.text);
                  print(_passwordController.text);
                  print(_repasswordController.text);
                  signUp();
                }),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Бүртгэлтэй хаяг байгаа юу?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Нэвтрэх',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future signUp() async {
    if (_passwordController.text.trim() != _repasswordController.text.trim()) {
      Utils.showSnackBar("Passwords do not match");
      return;
    }
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      String userId = userCredential.user!.uid;

      Map<String, dynamic> userData = {
        "email": _emailController.text.trim(),
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set(userData);
      UserPreferences.setUser(userId);
      Navigator.pushNamed(context, 'ProfileInformationScreen');
    } on FirebaseAuthException catch (error) {
      print(error);
      Utils.showSnackBar(error.message);
    } catch (e) {
      print(e);
      Utils.showSnackBar(e.toString());
    }
  }
}
