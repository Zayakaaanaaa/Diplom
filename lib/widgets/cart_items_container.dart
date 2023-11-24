import 'package:flutter/material.dart';
import 'package:grocery_store/model/cart_list.dart';
import 'package:sizer/sizer.dart';

import 'cart_item_card.dart';

class CartItemContainer extends StatelessWidget {
  final Future<List<CartProduct>> cartItems;

  const CartItemContainer({
    super.key,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: FutureBuilder<List<CartProduct>>(
        future: cartItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show a loader while waiting
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); // Show error message
          } else if (snapshot.hasData) {
            return Wrap(
              spacing: 5.5.w,
              runSpacing: 4.w,
              children: snapshot.data!
                  .map((cartItem) => CartItem(cartItem: cartItem))
                  .toList(),
            );
          } else {
            return Text('No items in the cart'); // Handle no data scenario
          }
        },
      ),
    );
  }
}
