import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'store_card.dart';

class StoreItemContainer extends StatelessWidget {
  final List<StoreCard> storeCard;

  const StoreItemContainer({
    super.key,
    required this.storeCard,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.w),
      alignment: Alignment.topCenter,
      child: Wrap(spacing: 5.5.w, runSpacing: 4.w, children: storeCard),
    );
  }
}
