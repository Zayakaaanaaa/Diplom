import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_store/model/product_detail.dart';
import 'package:grocery_store/model/store.dart';
import 'package:grocery_store/pages/cart_screen.dart';
import 'package:grocery_store/pages/favorite_screen.dart';
import 'package:grocery_store/pages/profile/profile_screen.dart';
import 'package:grocery_store/services/grocery.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/widgets/banner_slider.dart';
import 'package:grocery_store/widgets/bottom_navigation_item.dart';
import 'package:grocery_store/widgets/store_card.dart';
import 'package:grocery_store/widgets/store_item_container.dart';
import 'package:sizer/sizer.dart';

import '../widgets/behavior.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/product_card.dart';
import '../widgets/product_card_container.dart';
import 'category_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  GroceryModel groceryModel = GroceryModel();
  int bottomBarIndex = 0;
  // List<ProductDetails>? _productDetail;
  // final List<ProductDetails> _productDetail = GroceryModel.getProductDetail();
  // final List<StoreCard> _storeDetail = GroceryModel.getStoreDetail();
  final List<String> _carouselItems = GroceryModel.getCarouselItems();
  Future<List<ProductDetails>>? _products;
  Future<List<StoreCard>>? _stores;

  Future<void> loadData() async {
    _products = groceryModel.getAllProducts();
    _stores = groceryModel.getStores();
  }

  @override
  void initState() {
    loadData();
    // TODO: implement initState
    super.initState();
  }
  // Future<ProductDetail> product = GroceryModel.getProductDetail1();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(100.h, 10.h),
          child: HomeAppBar(),
        ),
        body: ScrollConfiguration(
          behavior: Behavior(),
          child: Container(
            padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
            child: ListView(
              children: [
                // HomeAppBar(),
                Location(),
                kSizedBoxHeight,
                SearchTextField(),
                kSizedBoxHeight,
                BannerSlider(
                  carouselItems: _carouselItems,
                ),
                kSizedBoxHeight,
                CategoryText(),
                kSizedBoxHeight,
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
                kSizedBoxHeight,
                CategoryText(),
                FutureBuilder<List<StoreCard>>(
                  future: _stores,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Display loading indicator while data is loading
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      // Handle error case
                      return Text("Error: ${snapshot.error}");
                    } else if (snapshot.hasData) {
                      // Data loaded successfully
                      List<StoreCard> _stores = snapshot.data!;
                      return SingleChildScrollView(
                        child: StoreItemContainer(
                          storeCard: _stores,
                        ),
                      );
                    } else {
                      // Handle no data case
                      return Text("No products found");
                    }
                  },
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
            )
          ],
        ),
      ),
    );
  }

  Row Location() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.location_on,
          size: 5.h,
          color: kHomeScreenLocationColor,
        ),
        Text(
          kHomeScreenLocationText,
          style: kHomeScreenLocationTextStyle,
        ),
      ],
    );
  }

  Row CategoryText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          kHomeScreenCategoriesText,
          style: kCategoryTextStyle,
        ),
        Text(
          kHomeScreenListViewText,
          style: kHomeScreenListViewTextStyle,
        )
      ],
    );
  }

  Container SearchTextField() {
    return Container(
      height: 8.h,
      decoration: BoxDecoration(
        color: kScaffoldColor,
        boxShadow: kBoxShadow,
      ),
      child: TextField(
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: kHomeScreenHintText,
          hintStyle: kHomeScreenHintTextStyle,
          filled: true,
          fillColor: kTextFieldColor,
          prefixIcon: Padding(
              padding: EdgeInsets.all(2.5.w), child: Icon(Icons.search)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.w),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Container HomeAppBar() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/Group.png',
        height: 10.h,
      ),
    );
  }
}
