import 'package:flutter/material.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:sizer/sizer.dart';

import 'search_text_field.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? widget;
  final Icon? leadIcon;
  final Icon? actionIcon;
  final String? title;
  final Color? bgColor;

  const CustomAppBar(
      {super.key,
      this.actionIcon,
      this.leadIcon,
      this.title,
      this.bgColor,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.w, 3.w, 0.w, 0.w),
      child: AppBar(
        // centerTitle: true,
        elevation: 0,
        backgroundColor: bgColor,
        leading: leadIcon == null && widget == null
            ? null
            : widget == null
                ? Container(
                    margin: EdgeInsets.all(1.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.w),
                      color: kPrimaryColor.withOpacity(0.1),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: leadIcon!,
                        iconSize: 15.0.sp,
                        color: kPrimaryColor,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  )
                : const SearchTextField(),
        actions: actionIcon != null
            ? [
                IconButton(
                  iconSize: 15.0.sp,
                  color: kIconColor,
                  icon: actionIcon!,
                  onPressed: () {},
                )
              ]
            : null,
        title: title != null
            ? Text(
                title!,
                style: kSemibold18,
              )
            : null,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(10.h);
}

// import 'package:flutter/material.dart';
// import 'package:grocery_store/util/constants.dart';
// import 'package:sizer/sizer.dart';

// class CustomAppBar extends StatefulWidget {
  // final Icon? leadIcon;
  // final Icon? actionIcon;
  // final String? title;

  // CustomAppBar({
  //   this.actionIcon,
  //   this.leadIcon,
  //   this.title,
//   });

//   @override
//   State<CustomAppBar> createState() => _CustomAppBarState();
// }

// class _CustomAppBarState extends State<CustomAppBar> {
  // @override
  // Widget build(BuildContext context) {
  //   return AppBar(
  //     leading: Icon(
  //       (widget.leadIcon) as IconData?,
  //       size: 20.0.sp,
  //       color: kCategoryTextColor,
  //     ),
  //     actions: [
  //       Icon(
  //         widget.actionIcon as IconData?,
  //         size: 20.0.sp,
  //         color: kCategoryTextColor,
  //       ),
  //     ],
  //     title: Text(
  //       widget.title ?? Text("b"),
  //     ),
  //   );
  // }
// }
