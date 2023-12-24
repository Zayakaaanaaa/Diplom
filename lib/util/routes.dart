import 'package:flutter/material.dart';
import 'package:grocery_store/pages/employee_screens/employee_screen.dart';

import '../pages/home.dart';
import '../pages/adminProfile/admin_screen.dart';
import '../pages/userProfile/user_screen.dart';

enum RouteNames {
  HomePage,
  AdminProfileScreen,
  EmployeeProfileScreen,
  UserProfileScreen
}

extension RouteExtension on RouteNames {
  String get route {
    switch (this) {
      case RouteNames.HomePage:
        return 'HomePage';
      case RouteNames.AdminProfileScreen:
        return 'AdminProfileScreen';
      case RouteNames.EmployeeProfileScreen:
        return 'EmployeeProfileScreen';
      case RouteNames.UserProfileScreen:
        return 'UserProfileScreen';
    }
  }
}

var routes = <String, WidgetBuilder>{
  RouteNames.HomePage.route: (_) => HomePage(),
  RouteNames.AdminProfileScreen.route: (_) => AdminProfileScreen(),
  RouteNames.EmployeeProfileScreen.route: (_) => EmployeeProfileScreen(),
  RouteNames.UserProfileScreen.route: (_) => UserProfileScreen(),
};
