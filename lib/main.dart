// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:grocery_store/pages/home.dart';
import 'package:grocery_store/pages/login_screen.dart';
import 'package:grocery_store/pages/profile/get_profile_information_screen.dart';
import 'package:grocery_store/pages/profile/map_screen.dart';
import 'package:grocery_store/pages/sign_up_screen.dart';
import 'package:grocery_store/pages/splash_screen.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/util/routes.dart';
import 'package:sizer/sizer.dart';

import 'util/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          scaffoldMessengerKey: Utils.messengerKey,
          navigatorKey: navigatorKey,
          routes: {
            'HomePage': (context) => HomePage(),
            'ProfileInformationScreen': (context) => ProfileInformationScreen(),
            // Define other routes as needed
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              fontFamily: 'Gilroy',
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: kScaffoldColor),
          home: MapScreen(
              // productId: 1,
              ),
        );
      },
    );
  }
}
