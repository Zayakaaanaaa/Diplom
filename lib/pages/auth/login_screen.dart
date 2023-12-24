// ignore_for_file: prefer_final_fields, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/pages/auth/sign_up_screen.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/util/employee.dart';
import 'package:grocery_store/widgets/custom_text_field.dart';
import 'package:grocery_store/widgets/text_button.dart';
import 'package:sizer/sizer.dart';

import '../../util/user.dart';
import '../../util/utils.dart';
import '../../widgets/custom_textform_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(
              8.w,
              10.w,
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
                  text: 'Нэвтрэх',
                  onPressed: () {
                    signIn(context);
                    // Navigator.pushNamed(context, 'HomePage');
                  },
                ),
                SizedBox(
                  height: 3.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Бүртгэлтэй хаяг байхгүй юу?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      },
                      child: Text('Бүртгүүлэх'),
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

  Future<void> signIn(BuildContext context) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Utils.showSnackBar('Please enter both email and password.');
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String userId = userCredential.user!.uid;
      UserPreferences.setUser(userId);

      await checkUserRoleAndNavigate(userId, context);
    } on FirebaseAuthException catch (error) {
      Utils.showSnackBar(error.message);
    } catch (e) {
      Utils.showSnackBar('An error occurred: ${e.toString()}');
    }
  }

  Future<void> checkUserRoleAndNavigate(
      String userId, BuildContext context) async {
    String? userRole;

    if (await checkIfDocumentExists('admin', userId)) {
      userRole = 'admin';
    } else if (await checkIfDocumentExists('storeEmployee', userId)) {
      EmployeePreferences.setEmployee(userId);
      userRole = 'employee';
    } else if (await checkIfDocumentExists('users', userId)) {
      userRole = 'user';
    }

    if (userRole != null) {
      await UserPreferences.setUserRole(userRole);
      navigateToRoleBasedScreen(userRole, context);
    } else {
      Utils.showSnackBar('Хэрэглэгчийн мэдээлэл олдсонгүй');
    }
  }

  Future<bool> checkIfDocumentExists(String collection, String docId) async {
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection(collection)
        .doc(docId)
        .get();
    return docSnapshot.exists;
  }

  void navigateToRoleBasedScreen(String userRole, BuildContext context) {
    switch (userRole) {
      case 'admin':
        Navigator.pushNamed(context, 'AdminProfileScreen');
        break;
      case 'employee':
        Navigator.pushNamed(context, 'EmployeeProfileScreen');
        break;
      case 'user':
        Navigator.pushNamed(context, 'UserProfileScreen');
        break;
      default:
        Utils.showSnackBar('Бүртгэлгүй хэрэглэгч');
    }
  }
}
