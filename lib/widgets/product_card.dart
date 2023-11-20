// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:grocery_store/model/product_detail.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:sizer/sizer.dart';

import '../pages/detail_screen.dart';

class ProductDetails extends StatelessWidget {
  final ProductDetail productDetail;

  const ProductDetails({super.key, required this.productDetail});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(
                    productId: productDetail.id!,
                  )),
        );
        // await navi.newScreen(
        //     newScreen: () {
        //       // DetailScreen(
        //       //   productId: ProductDetail.id,
        //       // );
        //     },
        //     context: context);
        print(productDetail.id);
      },
      child: Container(
        padding: EdgeInsets.all(1.5.h),
        width: 42.w,
        height: 28.h,
        decoration: BoxDecoration(
          // color: kSearchHintTextColor,
          border: Border.all(
            color: kBorderColor,
            width: 1.sp,
          ),
          borderRadius: BorderRadius.circular(5.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              productDetail.img,
              height: 11.h,
              width: double.infinity,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              productDetail.name,
              style: kProductDetailsNameTextStyle,
            ),
            Text(
              productDetail.size,
              style: kRegular12,
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${productDetail.price}",
                  style: kMedium12,
                ),
                GestureDetector(
                  onTap: () {
                    print('test');
                  },
                  child: Container(
                    height: 10.w,
                    width: 10.w,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(4.w),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: kScaffoldColor,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
