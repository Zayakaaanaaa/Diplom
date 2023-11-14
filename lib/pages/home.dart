import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  int bottomBarIndex = 0;
  // List<ProductDetails>? _productDetail;

  final List<ProductDetails> _productDetail = GroceryModel.getProductDetail();
  final List<StoreCard> _storeDetail = GroceryModel.getStoreDetail();
  final List<String> _carouselItems = GroceryModel.getCarouselItems();

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
                (_productDetail == null)
                    ? Container(
                        height: 25.h,
                        decoration: const BoxDecoration(color: kPrimaryColor))
                    : (_productDetail.isEmpty)
                        ? const Center(
                            child: Text("k404Text"),
                          )
                        : BannerSlider(
                            carouselItems: _carouselItems,
                          ),
                kSizedBoxHeight,
                CategoryText(),
                kSizedBoxHeight,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: (_productDetail == null)
                      ? Container(
                          height: 25.h,
                          decoration: const BoxDecoration(color: kPrimaryColor))
                      : (_productDetail.isEmpty)
                          ? const Center(
                              child: Text("k404Text"),
                            )
                          : ProductDetailsContainer(
                              productDetail: _productDetail,
                            ),
                ),
                kSizedBoxHeight,
                CategoryText(),
                SingleChildScrollView(
                  child: (_storeDetail == null)
                      ? Container(
                          height: 25.h,
                          decoration: const BoxDecoration(color: kPrimaryColor))
                      : (_storeDetail.isEmpty)
                          ? const Center(
                              child: Text("k404Text"),
                            )
                          : StoreItemContainer(
                              storeCard: _storeDetail,
                            ),
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

// class Behavior extends ScrollBehavior {
//   @override
//   Widget buildViewport(
//       BuildContext context, Widget child, AxisDirection axisDirection) {
//     return child;
//   }
// }
