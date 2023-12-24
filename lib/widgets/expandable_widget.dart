import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../util/constants.dart';

class ExpandableWidget extends StatefulWidget {
  final String title;
  final String description;

  const ExpandableWidget(
      {super.key, required this.title, required this.description});

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  bool isExpanded = false;

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: kBorderColor,
              width: 1.sp,
            ),
            // bottom: BorderSide(
            //   color: kSearchHintTextColor,
            //   width: 1.sp,
            // ),
          ),
        ),
        child: ExpandablePanel(
          header: Container(
            padding: EdgeInsets.all(1.h),
            child: Text(
              widget.title,
              style: kMedium12,
            ),
          ),
          collapsed: Container(
            height: 0,
          ),
          expanded: Container(
            padding: EdgeInsets.all(1.h),
            child: Text(
              widget.description,
              style: kRegular12Black,
              softWrap: true,
            ),
          ),
        ),
      ),
    );
  }
}
