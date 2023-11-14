import 'package:flutter/material.dart';
import 'package:grocery_store/model/cart_list.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:sizer/sizer.dart';

class FavoriteItem extends StatelessWidget {
  final CartProduct favoriteItems;

  const FavoriteItem({
    super.key,
    required this.favoriteItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      width: double.infinity,
      // padding: EdgeInsets.all(2.w),
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        color: kScaffoldColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey
                .withOpacity(0.2), // Shadow color with some transparency
            spreadRadius: 1, // Extend the shadow to all sides by 1 unit
            blurRadius: 5, // Blur radius for the shadow
            offset: const Offset(0, 3), // Position of the shadow
          ),
        ],
        // border: Border(
        //   top: BorderSide(color: kBorderColor, width: 1.sp),
        // ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            favoriteItems.img,
            height: 8.h,
          ),
          SizedBox(
            width: 40.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  favoriteItems.name,
                  style: kProductDetailsNameTextStyle,
                ),
                SizedBox(
                  height: 2.w,
                ),
                Text(
                  favoriteItems.subName,
                  style: kRegular12,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${favoriteItems.price}',
                style: kMedium12,
              ),
              const Icon(Icons.keyboard_arrow_right_rounded),
            ],
          )
        ],
      ),
    );
  }
}
