import 'package:flutter/material.dart';
import 'package:grocery_store/model/product_detail.dart';
import 'package:grocery_store/services/grocery.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/widgets/custom_counter.dart';
import 'package:grocery_store/widgets/expandable_widget.dart';
import 'package:grocery_store/widgets/product_card.dart';
import 'package:grocery_store/widgets/text_button.dart';
import 'package:sizer/sizer.dart';
import '../util/user.dart';
import '../widgets/custom_app_bar.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  final ProductDetail productDetail;

  const DetailScreen(
      {super.key, required this.productDetail, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();

  // Future<widget.ProductDetailetProductDetail() async {
  //   GroceryModel videoModel = GroceryModel();
  //   widget.ProductDetailmp = await videoModel.getProductDetail(id: productId);
  //   return temp;
  // }
}

class _DetailScreenState extends State<DetailScreen> {
  int _quantity = 1;

  // List<widget.ProductDetailidget.productDetailGroceryModel.getProductDetail();

  // @override
  // void initState() {
  //   super.initState();
  //   () async {
  //     widget.ProductDetailmp = await widget.getProductDetail();
  //     print('dasdasd');

  //     setState(() {
  //       widget.productDetailtemp;
  //     });
  //   };
  // }

  @override
  Widget build(BuildContext context) {
    String? userID = UserPreferences.getUser();
    return Scaffold(
      backgroundColor: kScaffoldColor,
      appBar: const CustomAppBar(
        leadIcon: Icon(Icons.arrow_back_ios_rounded),
        actionIcon: Icon(Icons.ios_share_rounded),
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
                                Text(
                                  widget.productDetail.name,
                                  style: kSemibold18,
                                ),
                                // Text(
                                //   widget.productDetail.productDetail.size,
                                //   style: kRegular12,
                                // ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () async {
                                await firestore
                                    .collection('favoriteProducts')
                                    .doc(userID)
                                    .collection('product')
                                    .add(
                                  {
                                    'product': widget.id,
                                  },
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.only(right: 2.w),
                                child: Icon(
                                  Icons.favorite_border_rounded,
                                  size: 24.0.sp,
                                  color: kInActiveFavoriteButtonColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 3.h),
                        CustomCounter(
                          onCounterChanged: (quantity) {
                            _quantity = quantity;
                          },
                          buttonBorder: true,
                          counterBorder: false,
                          quantity: _quantity,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        ExpandableWidget(
                          title: widget.productDetail.productDetailTitle!,
                          description: widget.productDetail.productDetail!,
                        ),
                        CustomTextButton(
                          text: 'text',
                          onPressed: () async {
                            groceryModel.addProductToCart(
                                userID!, widget.id, _quantity);
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
