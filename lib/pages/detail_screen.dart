// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery_store/model/product_detail.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/util/utils.dart';
import 'package:grocery_store/widgets/custom_counter.dart';
import 'package:grocery_store/widgets/expandable_widget.dart';
import 'package:grocery_store/widgets/text_button.dart';
import 'package:sizer/sizer.dart';
import '../util/user.dart';
import '../widgets/custom_app_bar.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  final ProductDetail productDetail;

  const DetailScreen({
    super.key,
    required this.productDetail,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _quantity = 1;
  String? userID = UserPreferences.getUser();
  bool? isFavorite;
  double? price;
  Future<void> checkFavorite() async {
    bool favoriteStatus = await groceryModel.isFavorite(userID, widget.id);
    setState(() {
      isFavorite = favoriteStatus;
    });
  }

  Future<void> toggleFavorite() async {
    await groceryModel.addOrRemoveFavorite(
        userID, widget.id, context, _quantity);
    await checkFavorite();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    checkFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      appBar: CustomAppBar(
        leadIcon: Icon(Icons.arrow_back_ios_rounded),
        bgColor: kTextFieldColor,
      ),
      body: (widget.productDetail == null)
          ? GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Text(kBottomNavigationFifthText),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 40.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kTextFieldColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.zero,
                        bottom: Radius.circular(5.h),
                      ),
                    ),
                    child: Image.network(
                      widget.productDetail.img,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 3.w),
                                  child: Text(
                                    widget.productDetail.name,
                                    overflow: TextOverflow.clip,
                                    style: kSemibold18,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 2.w),
                              child: FutureBuilder<bool>(
                                future:
                                    groceryModel.isFavorite(userID, widget.id),
                                builder: (BuildContext context,
                                    AsyncSnapshot<bool> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {}
                                  if (snapshot.hasData) {
                                    return GestureDetector(
                                      onTap: () async {
                                        await toggleFavorite(); // Toggle favorite status
                                      },
                                      child: Icon(
                                        isFavorite ?? false
                                            ? Icons.favorite
                                            : Icons.favorite_border_rounded,
                                        size: 24.sp,
                                        color: Colors.red,
                                      ),
                                    );
                                  }
                                  return Text("Error or No data");
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 3.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomCounter(
                              onCounterChanged: (quantity) {
                                _quantity = quantity;
                                setState(() {});
                              },
                              buttonBorder: true,
                              counterBorder: false,
                              quantity: _quantity,
                            ),
                            Text(
                              "₮${widget.productDetail.sansar! * _quantity}",
                              style: kSemibold15,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        ExpandableWidget(
                          title: widget.productDetail.productDetailTitle!,
                          description: widget.productDetail.productDetail!,
                        ),
                        CustomTextButton(
                          text: 'Бүтээгдэхүүн нэмэх',
                          onPressed: () async {
                            groceryModel.addProductToCart(
                                userID!, widget.id, _quantity);
                            Utils.showSnackBar(
                                'Бүтээгдэхүүнийг сагсанд нэмлээ.');
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
