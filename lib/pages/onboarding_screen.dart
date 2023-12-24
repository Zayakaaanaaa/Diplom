import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/pages/auth/login_screen.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/widgets/text_button.dart';
import 'package:sizer/sizer.dart';

import 'home.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/onboarding.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 500,
              ),
              Container(
                // padding: EdgeInsets.all(5.h),
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                // color: Colors.black.withOpacity(0.6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      kOnboardingText,
                      style: kOnboardingTextStyle,
                      textAlign: TextAlign.start,
                    ),
                    // SizedBox(height: 1.h),
                    CustomTextButton(
                      text: kOnboardingButtonText,
                      onPressed: () {
                        _handleButtonPress();
                      },
                    )
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: Text('Get Started'),
                    //   style: ElevatedButton.styleFrom(
                    //     padding:
                    //         EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    //     primary: Colors.green,
                    //     textStyle: TextStyle(
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              )
            ],
          ),
        ],
      ),
    );
  }

  void _handleButtonPress() {
    FirebaseAuth auth = FirebaseAuth.instance;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return StreamBuilder<User?>(
            stream: auth.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('ALDAA'));
              } else if (snapshot.hasData) {
                return HomePage();
              } else {
                return LoginScreen();
              }
            },
          );
        },
      ),
    );
  }
}
