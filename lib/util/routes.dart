import 'package:flutter/material.dart';

import '../pages/home.dart';

enum RouteNames {
  HomePage,
  navigationButton,
  loginPage,
  teacherOrStudent,
  registerPage,
  courseCreate;
}

extension RouteExtension on RouteNames {
  String get route {
    switch (this) {
      case RouteNames.HomePage:
        return 'HomePage';
      case RouteNames.navigationButton:
        return 'navigationButton';
      case RouteNames.loginPage:
        return 'loginPage';
      case RouteNames.teacherOrStudent:
        return 'teacherorstudent';
      case RouteNames.registerPage:
        return 'registerPage';
      case RouteNames.courseCreate:
        return 'courseCreate';
    }
  }
}

var routes = <String, WidgetBuilder>{
  RouteNames.HomePage.route: (_) => HomePage(),
  // RouteNames.navigationButton.route: (_) => NavigationButton(),
  // RouteNames.loginPage.route: (_) => LoginPage(),
  // RouteNames.teacherOrStudent.route: (_) => TeacherOrStudent(),
  // RouteNames.registerPage.route: (_) => RegisterPage(),
  // RouteNames.courseCreate.route: (_) => CourseCreate(),
};
