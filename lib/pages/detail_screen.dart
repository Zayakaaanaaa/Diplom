import 'package:flutter/material.dart';
import 'package:grocery_store/services/grocery.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/widgets/custom_counter.dart';
import 'package:grocery_store/widgets/expandable_widget.dart';
import 'package:grocery_store/widgets/product_card.dart';
import 'package:grocery_store/widgets/text_button.dart';
import 'package:sizer/sizer.dart';
import '../widgets/custom_app_bar.dart';

class DetailScreen extends StatefulWidget {
  final int productId;

  const DetailScreen({super.key, required this.productId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();

  // Future<ProductDetails> getProductDetail() async {
  //   GroceryModel videoModel = GroceryModel();
  //   ProductDetails temp = await videoModel.getProductDetail(id: productId);
  //   return temp;
  // }
}

class _DetailScreenState extends State<DetailScreen> {
  List<ProductDetails> productDetails = GroceryModel.getProductDetail();

  // @override
  // void initState() {
  //   super.initState();
  //   () async {
  //     ProductDetails temp = await widget.getProductDetail();
  //     print('dasdasd');

  //     setState(() {
  //       productDetails = temp;
  //     });
  //   };
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      appBar: const CustomAppBar(
        leadIcon: Icon(Icons.arrow_back_ios_rounded),
        actionIcon: Icon(Icons.ios_share_rounded),
        bgColor: kTextFieldColor,
      ),
      body: (productDetails[0].productDetail == null)
          ? GestureDetector(
              onTap: () {
                print(widget.productId);
                print(productDetails);
              },
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
                    child: Image.asset(
                      productDetails[0].productDetail.img,
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
                                  productDetails[0].productDetail.name,
                                  style: kSemibold18,
                                ),
                                Text(
                                  productDetails[0].productDetail.size,
                                  style: kRegular12,
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 2.w),
                              child: Icon(
                                Icons.favorite_border_rounded,
                                size: 24.0.sp,
                                color: kInActiveFavoriteButtonColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 3.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomCounter(
                              buttonBorder: true,
                              counterBorder: false,
                              quantity: 5,
                            ),
                            Text(
                              '\$${productDetails[0].productDetail.price}',
                              style: kSemibold18,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        ExpandableWidget(
                          title: productDetails[0]
                              .productDetail
                              .productDetailTitle!,
                          description:
                              productDetails[0].productDetail.productDetail!,
                        ),
                        ExpandableWidget(
                          title:
                              productDetails[0].productDetail.nutritionTitle!,
                          description:
                              productDetails[0].productDetail.nutritionDetail!,
                        ),
                        CustomTextButton(
                          text: 'text',
                          onPressed: () {
                            print('add to basket');
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
