import 'package:flutter/material.dart';
import 'package:grocery_store/widgets/store_card.dart';
import 'package:sizer/sizer.dart';

class StoreItemContainer extends StatelessWidget {
  final List<StoreCard> storeCard;

  const StoreItemContainer({
    super.key,
    required this.storeCard,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Wrap(spacing: 5.5.w, runSpacing: 4.w, children: storeCard),
    );
  }
}
