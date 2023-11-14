import 'package:flutter/material.dart';
import 'package:grocery_store/model/store.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:sizer/sizer.dart';

class StoreCard extends StatelessWidget {
  final StoreDetail storeCards;

  const StoreCard({super.key, required this.storeCards});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      width: double.infinity,
      padding: EdgeInsets.only(top: 3.h),
      // margin: EdgeInsets.only(bottom: 3.h),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: kBorderColor, width: 1.sp),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                storeCards.img,
                height: 8.h,
                width: 10.h,
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                // width: 55.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      storeCards.name,
                      style: kProductDetailsNameTextStyle,
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                    Text(
                      storeCards.address,
                      style: kRegular12,
                    ),
                  ],
                ),
              ),
            ],
          ),
          storeCards.price != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${storeCards.price}',
                      style: kMedium12,
                    ),
                    const Icon(Icons.keyboard_arrow_right_rounded),
                  ],
                )
              : const Icon(Icons.keyboard_arrow_right_rounded),
        ],
      ),
    );
  }
}
