import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../util/constants.dart';

class IconContainer extends StatelessWidget {
  final String text;
  final IconData icon;

  IconContainer({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: kScaffoldColor,
          borderRadius: BorderRadius.circular(5.w),
          border: Border.all(width: 0.5.sp, color: kBorderColor),
          boxShadow: kBoxShadow),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 20.w,
            width: 20.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.w),
              color: kPrimaryColor.withOpacity(0.1),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                color: kPrimaryColor,
                size: 10.w,
              ),
            ),
          ),
          Text(
            text,
            style: kMedium12,
          )
        ],
      ),
    );
  }
}
