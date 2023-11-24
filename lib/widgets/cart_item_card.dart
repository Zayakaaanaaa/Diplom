import 'package:flutter/material.dart';
import 'package:grocery_store/model/cart_list.dart';
import 'package:grocery_store/model/product_detail.dart';
import 'package:grocery_store/services/grocery.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/util/user.dart';
import 'package:grocery_store/widgets/custom_counter.dart';
import 'package:sizer/sizer.dart';

class CartItem extends StatelessWidget {
  final CartProduct cartItem;

  const CartItem({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    String? userId = UserPreferences.getUser();
    return Container(
      height: 15.h,
      width: double.infinity,
      padding: EdgeInsets.all(3.w),
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
        future: groceryModel.getProductDetail1(cartItem.product),
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
              Image.network(
                productDetail.img,
                height: 8.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productDetail.name,
                    style: kProductDetailsNameTextStyle,
                  ),
                  Text(
                    "'",
                    style: kRegular12,
                  ),
                  CustomCounter(
                    quantity: cartItem.quantity,
                    counterBorder: true,
                    buttonBorder: false,
                    onCounterChanged: (newQuantity) async {
                      try {
                        cartItem.quantity = newQuantity;
                        await groceryModel.updateCartItemQuantity(
                            userId, cartItem.prodcutDocId, newQuantity);
                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Error updating quantity: $e')),
                        );
                      }
                    },
                    // other properties...
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(Icons.close_rounded),
                  Text(
                    "${GroceryModel.getCheapestPrice(productDetail.price).price.toStringAsFixed(2)}",
                    style: kMedium12,
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
