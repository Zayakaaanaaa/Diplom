import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/model/user.dart';
import 'package:sizer/sizer.dart';

import '../model/product_detail.dart';
import '../model/store_price.dart';
import '../pages/auth/login_screen.dart';
import '../services/grocery.dart';
import '../util/constants.dart';
import 'product_card.dart';
import 'product_card_container.dart';
import 'text_button.dart';

class UserProfile extends StatefulWidget {
  final UserModel userData;
  const UserProfile({super.key, required this.userData});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  GroceryModel groceryModel = GroceryModel();
  final List<ProductDetail> newProducts = GroceryModel.addProduct();
  Future<List<ProductDetails>>? _products;

  Future<void> loadData() async {
    _products = groceryModel.getAllProducts();
  }

  @override
  void initState() {
    // TODO: implement initState
    loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            FutureBuilder<List<ProductDetails>>(
              future: _products,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display loading indicator while data is loading
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Handle error case
                  return Text("Error: ${snapshot.error}");
                } else if (snapshot.hasData) {
                  // Data loaded successfully
                  List<ProductDetails> _products = snapshot.data!;
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        children: [
                          ProductDetailsContainer(
                              productDetail: _products), // Adjusted
                        ],
                      )
                      // ProductDetails(productDetail: _products), // Adjusted
                      );
                } else {
                  // Handle no data case
                  return Text("No products found");
                }
              },
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: (_products == null)
            //       ? Container(
            //           height: 25.h,
            //           decoration: const BoxDecoration(color: kPrimaryColor),
            //         )
            //       : ProductDetails(productDetail: _products),
            // ),
            CustomTextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
                FirebaseAuth.instance.signOut();
              },
              text: 'LogOut',
            ),
          ],
        ),
      ),
    );
  }
}
