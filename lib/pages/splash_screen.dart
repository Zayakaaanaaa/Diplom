import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:sizer/sizer.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.of(context).pushReplacement(
        CupertinoPageRoute(
          builder: ((context) => const Onboarding()),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashColor,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // decoration: BoxDecoration(color: Colors.red),
            Image.asset(
              'assets/images/splashScreen.png',
              // height: 30.h,
              // color: kScaffoldColor,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(kSplashScreenText, style: kSplashScreenTextStyle),
          ]),
        ),
      ),
    );
  }
}
