import 'package:flutter/material.dart';
import 'package:grocery_store/model/cart_list.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:sizer/sizer.dart';

import '../model/product_detail.dart';
import '../pages/favorite_screen.dart';
import '../services/grocery.dart';
import '../util/user.dart';

class FavoriteItem extends StatelessWidget {
  final CartProduct favoriteItems;

  const FavoriteItem({
    super.key,
    required this.favoriteItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14.h,
      width: double.infinity,
      // padding: EdgeInsets.all(2.w),
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        color: kScaffoldColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: FutureBuilder<ProductDetail>(
        future: groceryModel.getProductDetail1(favoriteItems.product),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData) {
            return Text('No data available');
          }
          final productDetail = snapshot.data!;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Image.network(
                      productDetail.img,
                      height: 10.h,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 35.w,
                        child: Text(
                          productDetail.name,
                          style: kMedium12,
                        ),
                      ),
                      Text(
                        ("₮${productDetail.emart}"),
                        style: kMedium12,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 5.h),
                child: IconButton(
                  onPressed: () {
                    groceryModel.removeFavorite(favoriteItems.prodcutDocId);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavoriteScreen()));
                  },
                  icon: Icon(
                    Icons.favorite_rounded,
                    size: 40,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
