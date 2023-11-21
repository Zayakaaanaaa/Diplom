import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/model/store.dart';
import 'package:grocery_store/pages/store_detail_screen.dart';
import 'package:grocery_store/services/grocery.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:sizer/sizer.dart';

class StoreCard extends StatelessWidget {
  final String id;
  final StoreDetail storeDetail;

  const StoreCard({super.key, required this.storeDetail, required this.id});

  Future<void> getStoreDetail(BuildContext context) async {
    try {
      // Fetch the document from Firestore using the document ID
      DocumentSnapshot storeId =
          await FirebaseFirestore.instance.collection('stores').doc(id).get();

      // Create a ProductDetail object from the snapshot
      StoreDetail storeDetail = StoreDetail.fromDocumentSnapshotMap(storeId);
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
            builder: (context) => StoreDetailScreen(
              storeDetail: storeDetail,
            ),
          ),
        );
      },
      child: Container(
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
                  storeDetail.img,
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
                        storeDetail.name,
                        style: kProductDetailsNameTextStyle,
                      ),
                      SizedBox(
                        height: 2.w,
                      ),
                      Text(
                        storeDetail.address,
                        style: kRegular12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$storeDetail.price}',
                  style: kMedium12,
                ),
                const Icon(Icons.keyboard_arrow_right_rounded),
              ],
            )
          ],
        ),
      ),
    );
  }
}
