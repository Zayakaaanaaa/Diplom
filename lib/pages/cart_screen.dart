import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/model/cart_list.dart';
import 'package:grocery_store/pages/price_compare_screen.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/util/user.dart';
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
  String? userID = UserPreferences.getUser();
  int bottomBarIndex = 2;
  Future<List<CartProduct>>? _cartItems;
  GroceryModel groceryModel = GroceryModel();
  Future<List<String>>? s;

  // Future<void> getSubcollectionDocumentIds(String userID) async {
  //   try {
  //     // Check if userID is not empty.
  //     if (userID.isEmpty) {
  //       print('User ID is empty.');
  //       return;
  //     }

  //     QuerySnapshot subcollectionSnapshot = await FirebaseFirestore.instance
  //         .collection('cartProducts')
  //         .doc(userID)
  //         .collection('product')
  //         .get();

  //     // Loop through the documents in the subcollection and print their IDs.
  //     subcollectionSnapshot.docs.forEach((doc) {
  //       print('Subcollection Document ID: ${doc.id}');
  //     });
  //   } catch (e) {
  //     print('Error getting subcollection document IDs: $e');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // groceryModel.getSubcollectionDocumentData(userID!);

    _cartItems = groceryModel.getSubcollectionDocumentData(userID!);
  }

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
                    ? Text('null ym algoo end chin')
                    : CartItemContainer(
                        cartItems: _cartItems!,
                      ),
                TextButton(
                  onPressed: () {},
                  child: Text('card'),
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
