// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:grocery_store/model/product_detail.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:sizer/sizer.dart';
import '../pages/detail_screen.dart';
import '../util/user.dart';
import '../util/utils.dart';

class ProductDetails extends StatelessWidget {
  final String id;
  final ProductDetail productDetail;

  const ProductDetails(
      {super.key, required this.productDetail, required this.id});

  @override
  Widget build(BuildContext context) {
    int _quantity = 1;
    String? userID = UserPreferences.getUser();

    return GestureDetector(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: id,
              productDetail: productDetail,
            ),
          ),
        );
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
            Image.network(
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
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${productDetail.sansar}',
                  style: kMedium12,
                ),
                GestureDetector(
                  onTap: () async {
                    groceryModel.addProductToCart(userID!, id, _quantity);
                    Utils.showSnackBar('Бүтээгдэхүүнийг сагсанд нэмлээ.');
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
