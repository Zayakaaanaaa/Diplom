import 'package:flutter/material.dart';
import 'package:grocery_store/model/store/review.dart';
import 'package:sizer/sizer.dart';

import '../../util/constants.dart';

class StoreReviewCard extends StatefulWidget {
  final Review review;

  const StoreReviewCard({super.key, required this.review});

  @override
  State<StoreReviewCard> createState() => _StoreReviewCardState();
}

class _StoreReviewCardState extends State<StoreReviewCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.w)),
                    clipBehavior: Clip.hardEdge,
                    height: 14.w,
                    width: 14.w,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.network(
                          'https://www.perfocal.com/blog/content/images/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg'),
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    widget.review.authorName,
                    style: kSemibold15,
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5.w),
                    padding: EdgeInsets.fromLTRB(3.w, 1.w, 3.w, 1.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.w),
                      border: Border.all(width: 2.sp, color: kPrimaryColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: kPrimaryColor,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          widget.review.rating.toString(),
                          style: kRegular10,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 3.w),
            child: Text(
              widget.review.content,
              style: kRegular12,
              overflow: TextOverflow.fade,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.favorite_border_rounded,
                color: kPrimaryColor,
                size: 20.sp,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                widget.review.likes.toString(),
                style: kRegular12,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                widget.review.date.toString(),
                style: kRegular12,
              ),
            ],
          )
        ],
      ),
    );
  }
}
