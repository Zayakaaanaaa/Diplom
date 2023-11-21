// ignore_for_file: empty_constructor_bodies

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/model/product_detail.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:sizer/sizer.dart';

import '../model/store_price.dart';
import '../pages/detail_screen.dart';
import '../services/grocery.dart';

class ProductDetails extends StatelessWidget {
  final String id;
  final ProductDetail productDetail;

  const ProductDetails(
      {super.key, required this.productDetail, required this.id});

  Future<void> navigateToDetailScreen(BuildContext context) async {
    try {
      // Fetch the document from Firestore using the document ID
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('productDetails')
          .doc(id)
          .get();

      // Create a ProductDetail object from the snapshot
      ProductDetail productDetail =
          ProductDetail.fromDocumentSnapshot(docSnapshot);
    } catch (e) {
      // Handle errors or non-existent documents
      print('Error fetching product details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
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
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${GroceryModel.getCheapestPrice(productDetail.price).price.toStringAsFixed(2)}",
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
