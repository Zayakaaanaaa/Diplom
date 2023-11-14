import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../util/constants.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        color: kTextFieldColor,
        boxShadow: kBoxShadow,
      ),
      clipBehavior: Clip.hardEdge,
      child: Center(
        child: TextField(
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            hintText: kHomeScreenHintText,
            hintStyle: kHomeScreenHintTextStyle,
            filled: true,
            fillColor: kTextFieldColor,
            prefixIcon: Padding(
                padding: EdgeInsets.fromLTRB(5.w, 3.w, 3.w, 3.w),
                child: Icon(Icons.search)),
          ),
        ),
      ),
    );
  }
}
