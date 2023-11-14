import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'cart_item_card.dart';

class CartItemContainer extends StatelessWidget {
  final List<CartItem> cartItems;

  const CartItemContainer({super.key, 
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Wrap(spacing: 5.5.w, runSpacing: 4.w, children: cartItems),
    );
  }
}
