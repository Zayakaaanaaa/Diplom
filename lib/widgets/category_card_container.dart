import 'package:flutter/material.dart';
import 'package:grocery_store/widgets/category_card.dart';
import 'package:sizer/sizer.dart';

class CategoryCardContainer extends StatelessWidget {
  final List<CategoryCard> categoryCards;

  const CategoryCardContainer({
    super.key,
    required this.categoryCards,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: Wrap(spacing: 4.w, runSpacing: 4.w, children: categoryCards),
      ),
    );
  }
}
