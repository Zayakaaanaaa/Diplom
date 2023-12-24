import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../model/store/branch.dart';
import '../../util/constants.dart';

class StoreBranchCard extends StatefulWidget {
  final Branch branch;

  const StoreBranchCard({super.key, required this.branch});

  @override
  State<StoreBranchCard> createState() => _StoreBranchCardState();
}

class _StoreBranchCardState extends State<StoreBranchCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.w),
      child: Card(
        margin: EdgeInsets.all(0.5.w),
        color: kScaffoldColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.w)),
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.branch.name,
                style: kSemibold12,
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  Text('Ажиллах цагийн хуваарь : ', style: kPrimary12),
                  SizedBox(width: 1.w),
                  Text(widget.branch.schedule, style: kRegularGrey12)
                ],
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  Text('Байршил', style: kPrimary12),
                  SizedBox(width: 1.h),
                  Icon(Icons.location_on, color: kPrimaryColor, size: 25),
                ],
              ),
              SizedBox(height: 1.h),
              Text(
                widget.branch.location,
                overflow: TextOverflow.fade,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
