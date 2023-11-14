import 'package:flutter/material.dart';
import 'package:grocery_store/model/cart_list.dart';
import 'package:grocery_store/util/constants.dart';
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
            color: Colors.grey
                .withOpacity(0.2), // Shadow color with some transparency
            spreadRadius: 1, // Extend the shadow to all sides by 1 unit
            blurRadius: 5, // Blur radius for the shadow
            offset: const Offset(0, 3), // Position of the shadow
          ),
        ],
        // border: Border(
        //   top: BorderSide(color: kBorderColor, width: 1.sp),
        // ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            cartItem.img,
            height: 8.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItem.name,
                style: kProductDetailsNameTextStyle,
              ),
              Text(
                cartItem.subName,
                style: kRegular12,
              ),
              CustomCounter(
                counterBorder: true,
                buttonBorder: false,
                quantity: cartItem.quantity,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.close_rounded),
              Text(
                '\$${cartItem.price}',
                style: kMedium12,
              ),
            ],
          )
        ],
      ),
    );
  }
}
