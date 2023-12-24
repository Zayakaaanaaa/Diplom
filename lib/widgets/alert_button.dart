import 'package:flutter/material.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:sizer/sizer.dart';

class AlertTextButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  // final int width;

  const AlertTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    // required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3.h),
      // height: 7.h,
      width: 30.w,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        gradient: const LinearGradient(
          colors: [Color(0XFF43DD86), Color(0XFF27CA7D)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: kButtonTextStyle,
        ),
      ),
    );
  }
}
