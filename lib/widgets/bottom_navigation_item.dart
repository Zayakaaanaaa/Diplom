import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../util/constants.dart';

class BottomNavigationItem extends StatelessWidget {
  final Icon icon;
  final double iconSize;
  final Function? onPressed;
  final String iconText;
  final bool active;
  // Color color;

  const BottomNavigationItem({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.iconText,
    required this.active,
    this.onPressed,
    // required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.w),
        color: active ? kPrimaryColor.withOpacity(0.20) : null,
      ),
      child: Row(
        children: [
          IconButton(
            iconSize: iconSize,
            color: kPrimaryColor,
            onPressed: () => onPressed!(),
            icon: icon,
          ),
          active
              ? Text(
                  iconText,
                  style: const TextStyle(color: kPrimaryColor),
                )
              : Container(),
        ],
      ),
    );
  }
}
