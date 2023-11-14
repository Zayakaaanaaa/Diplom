// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:sizer/sizer.dart';
import 'bottom_navigation_item.dart';

class BottomNavigation extends StatelessWidget {
  final List<BottomNavigationItem> children;
  final int index;
  final Color activeColor;

  BottomNavigation({
    required this.children,
    required this.index,
    required this.activeColor,
  }) {
    // children[index].kPrimaryColor = activeColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 5.w),
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        color: kScaffoldColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey
                .withOpacity(0.5), // Shadow color with some transparency
            spreadRadius: 1, // Extend the shadow to all sides by 1 unit
            blurRadius: 5, // Blur radius for the shadow
            offset: Offset(0, 3), // Position of the shadow
          ),
        ],
      ),
      height: 10.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }
}
