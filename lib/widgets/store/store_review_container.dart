import 'package:flutter/material.dart';
import 'package:grocery_store/model/store/review.dart';
import 'package:sizer/sizer.dart';
import 'store_review_card.dart';

class StoreReviewContainer extends StatelessWidget {
  final List<Review> reviews;

  const StoreReviewContainer({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 30.h,
      child: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return StoreReviewCard(review: reviews[index]);
        },
      ),
    );
  }
}
