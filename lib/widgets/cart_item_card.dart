import 'package:flutter/material.dart';
import 'package:grocery_store/model/cart_list.dart';
import 'package:grocery_store/model/product_detail.dart';
import 'package:grocery_store/services/grocery.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/util/user.dart';
import 'package:grocery_store/widgets/custom_counter.dart';
import 'package:sizer/sizer.dart';

import '../pages/cart_screen.dart';

class CartItem extends StatefulWidget {
  final CartProduct cartItem;

  const CartItem({
    super.key,
    required this.cartItem,
  });

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
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
        future: groceryModel.getProductDetail1(widget.cartItem.product),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {}
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
                width: 10.h,
              ),
              SizedBox(
                width: 1.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productDetail.name,
                    style: kProductDetailsNameTextStyle,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomCounter(
                    quantity: widget.cartItem.quantity,
                    counterBorder: true,
                    buttonBorder: false,
                    onCounterChanged: (newQuantity) async {
                      try {
                        setState(() {
                          widget.cartItem.quantity = newQuantity;
                        });
                        await groceryModel.updateCartItemQuantity(
                            userId, widget.cartItem.prodcutDocId, newQuantity);
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () async {
                      try {
                        await groceryModel
                            .deleteItem(widget.cartItem.prodcutDocId);
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartScreen(),
                            ),
                          );
                        });
                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error deleting item: $e')),
                        );
                      }
                    },
                    icon: Icon(Icons.close_rounded),
                  ),
                  Text(
                    ("₮${productDetail.emart! * widget.cartItem.quantity}"),
                    overflow: TextOverflow.ellipsis,
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
