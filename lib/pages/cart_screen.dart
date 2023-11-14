import 'package:flutter/material.dart';
import 'package:grocery_store/pages/price_compare_screen.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/widgets/cart_items_container.dart';
import 'package:grocery_store/widgets/custom_app_bar.dart';
import 'package:grocery_store/widgets/text_button.dart';
import 'package:sizer/sizer.dart';

import '../services/grocery.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/bottom_navigation_item.dart';
import '../widgets/cart_item_card.dart';
import 'category_screen.dart';
import 'favorite_screen.dart';
import 'home.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int bottomBarIndex = 2;
  final List<CartItem> _cartItems = GroceryModel.getCartItems();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          leadIcon: Icon(Icons.arrow_back),
          title: kCartScreenTitle,
          bgColor: kScaffoldColor,
        ),
        // body: Container(),
        body: Container(
          padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                (_cartItems == null)
                    ? Container(
                        height: 25.h,
                        decoration: const BoxDecoration(color: kPrimaryColor))
                    : (_cartItems.isEmpty)
                        ? const Center(
                            child: Text("k404Text"),
                          )
                        : CartItemContainer(
                            cartItems: _cartItems,
                          ),
                CustomTextButton(
                  text: kCartScreenButtonText,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PriceCompareScreen()));
                  },
                ),
                SizedBox(
                  height: 3.w,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigation(
          activeColor: kPrimaryColor,
          index: bottomBarIndex,
          children: [
            BottomNavigationItem(
              active: bottomBarIndex == 0 ? true : false,
              iconText: kBottomNavigationFirstText,
              icon: const Icon(Icons.storefront),
              iconSize: 22.sp,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            BottomNavigationItem(
              active: bottomBarIndex == 1 ? true : false,
              iconText: kBottomNavigationSecondText,
              icon: const Icon(Icons.manage_search_rounded),
              iconSize: 22.sp,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryPage()));
              },
            ),
            BottomNavigationItem(
              active: bottomBarIndex == 2 ? true : false,
              iconText: kBottomNavigationThirdText,
              icon: const Icon(Icons.shopping_cart_outlined),
              iconSize: 22.sp,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
            ),
            BottomNavigationItem(
              active: bottomBarIndex == 3 ? true : false,
              iconText: kBottomNavigationFourthText,
              icon: const Icon(Icons.favorite_border_rounded),
              iconSize: 22.sp,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavoriteScreen()));
              },
            ),
            BottomNavigationItem(
              active: bottomBarIndex == 4 ? true : false,
              iconText: kBottomNavigationFifthText,
              icon: const Icon(Icons.account_circle_outlined),
              iconSize: 22.sp,
              onPressed: () {
                print("5");
              },
            )
          ],
        ),
      ),
    );
  }
}
