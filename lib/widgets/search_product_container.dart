import 'package:flutter/material.dart';
import 'package:grocery_store/widgets/product_card.dart';
import 'package:sizer/sizer.dart';

class SearchProductContainer extends StatelessWidget {
  final List<ProductDetails> productDetail;

  const SearchProductContainer({
    super.key,
    required this.productDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Wrap(spacing: 5.5.w, runSpacing: 4.w, children: productDetail),
    );
  }
}
