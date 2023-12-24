import 'package:flutter/material.dart';
import 'package:grocery_store/model/store/branch.dart';
import 'package:sizer/sizer.dart';

import 'store_branch_card.dart';

class StoreBranchContainer extends StatelessWidget {
  final List<Branch> branches;

  const StoreBranchContainer({
    super.key,
    required this.branches,
  });

  @override
  Widget build(BuildContext context) {
    double containerHeight;
    if (branches.isEmpty) {
      containerHeight = 20.h;
    } else if (branches.length == 1) {
      containerHeight = 20.h;
    } else {
      containerHeight = (branches.length * 16.h).clamp(20.h, 80.h);
    }
    return Container(
      height: containerHeight,
      child: ListView.builder(
        itemCount: branches.length,
        itemBuilder: (context, index) {
          return StoreBranchCard(branch: branches[index]);
        },
      ),
    );
  }
}
