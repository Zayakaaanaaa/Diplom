import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/model/store/store.dart';
import 'package:grocery_store/pages/store_detail_screen.dart';
import 'package:grocery_store/services/grocery.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:sizer/sizer.dart';

import '../../util/user.dart';


class StoreCard extends StatelessWidget {
  final String id;
  final StoreDetail storeDetail;
  bool? phone;

  StoreCard(
      {super.key, required this.storeDetail, required this.id, this.phone});

  Future<void> getStoreDetail(BuildContext context) async {
    try {
      DocumentSnapshot storeId =
          await FirebaseFirestore.instance.collection('stores').doc(id).get();

      StoreDetail storeDetail = StoreDetail.fromDocumentSnapshotMap(storeId);
    } catch (e) {
      print('Error fetching product details: $e');
    }
  }

  String? userID = UserPreferences.getUser();

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
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          color: kScaffoldColor,
          boxShadow: kBoxShadow,
          borderRadius: BorderRadius.circular(5.w),
          border: Border.all(
            color: kBorderColor,
            width: 1.sp,
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
                  width: 4.w,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        storeDetail.name,
                        style: kProductDetailsNameTextStyle,
                      ),

                      Text(
                        'Цагийн хуваарь : 8:00 - 22:00',
                        style: kMediumGrey10,
                      ),

                      phone!
                          ? Text('Утасны дугаар: ${storeDetail.phone}')
                          : FutureBuilder<double>(
                              future: groceryModel.getCartPrice(
                                  userID!, storeDetail.name),
                              builder: (BuildContext context,
                                  AsyncSnapshot<double> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else if (!snapshot.hasData) {
                                  return Text('No price available');
                                } else {
                                  return Text('Total price: ${snapshot.data}');
                                }
                              },
                            ),
                      // Text(
                      //   'Нийт үнэ : ₮${storeDetail.phone}',
                      //   // storeDetail.phone,
                      //   style: kSemiboldBlack12,
                      // ),
                      // Text(
                      //   'Утас : 99556677',
                      //   // storeDetail.phone,
                      //   style: kMediumGrey10,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(right: 4.w),
              child: Icon(
                Icons.keyboard_arrow_right_rounded,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<double> getTotalSum() async {
    double totalSum = await calculateTotalSumAcrossStores();
    print(
        'The total sum of all product prices across all stores is: $totalSum');
    return totalSum;
  }

  Future<double> calculateTotalSumAcrossStores() async {
    double totalSum = 0.0;

    // Retrieve all products from Firestore
    QuerySnapshot productSnapshot =
        await FirebaseFirestore.instance.collection('productDetails').get();

    // Iterate through each product
    for (var productDoc in productSnapshot.docs) {
      // Retrieve the 'price' subcollection for each product
      var pricesSnapshot = await productDoc.reference.collection('price').get();

      // Sum the prices for this product across all stores
      double productSum = pricesSnapshot.docs.fold(0.0, (sum, doc) {
        return sum + (doc.data()['price'] as num).toDouble();
      });

      // Accumulate the sum for all products
      totalSum += productSum;
    }

    return totalSum;
  }
}
