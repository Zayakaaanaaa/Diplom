import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'store_product_card.dart';

class StoreProductContainer extends StatelessWidget {
  final List<StoreProductCard> productDetail;

  const StoreProductContainer({super.key, required this.productDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Wrap(spacing: 5.5.w, runSpacing: 4.w, children: productDetail),
    );
  }
}
