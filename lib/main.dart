// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/pages/home.dart';
import 'package:grocery_store/pages/userProfile/get_profile_information_screen.dart';
import 'package:grocery_store/pages/adminProfile/admin_screen.dart';
import 'package:grocery_store/pages/employee_screens/employee_screen.dart';
import 'package:grocery_store/pages/splash_screen.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:sizer/sizer.dart';
import 'pages/userProfile/user_screen.dart';
import 'util/user.dart';
import 'util/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
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
            'UserProfileScreen': (context) => UserProfileScreen(),
            'EmployeeProfileScreen': (context) => EmployeeProfileScreen(),
            'AdminProfileScreen': (context) => AdminProfileScreen(),
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              // fontFamily: 'Gilroy',
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: kScaffoldColor),
          home: SplashScreen(
              // productId: 1,
              ),
        );
      },
    );
  }
}
