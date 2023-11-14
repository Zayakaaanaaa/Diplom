import 'package:flutter/material.dart';

class Behavior extends ScrollBehavior {
  @override
  Widget buildViewport(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
