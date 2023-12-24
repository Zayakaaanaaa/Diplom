import 'package:flutter/material.dart';
import 'package:grocery_store/pages/add_product.dart';
import 'package:grocery_store/pages/test_search.dart';
import 'package:grocery_store/services/grocery.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/widgets/banner_slider.dart';
import 'package:grocery_store/widgets/bottom_navigation_container.dart';
import 'package:sizer/sizer.dart';
import '../widgets/behavior.dart';
import '../widgets/product_card.dart';
import '../widgets/product_card_container.dart';
import '../widgets/store/store_card.dart';
import '../widgets/store/store_item_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  GroceryModel groceryModel = GroceryModel();
  int bottomBarIndex = 0;
  final List<String> _carouselItems = GroceryModel.getCarouselItems();
  Future<List<ProductDetails>>? _products;
  Future<List<StoreCard>>? _stores;
  TextEditingController searchController = TextEditingController();

  Future<void> loadData() async {
    _products = groceryModel.getAllProducts();
    _stores = groceryModel.getStores(true);
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

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
                MySearchScreen(),
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
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else if (snapshot.hasData) {
                      List<ProductDetails> _products = snapshot.data!;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          children: [
                            ProductDetailsContainer(productDetail: _products),
                          ],
                        ),
                      );
                    } else {
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
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else if (snapshot.hasData) {
                      List<StoreCard> _stores = snapshot.data!;
                      return SingleChildScrollView(
                        child: StoreItemContainer(
                          storeCard: _stores,
                        ),
                      );
                    } else {
                      return Text("No products found");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            BottomNavigationContainer(bottomBarIndex: bottomBarIndex),
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
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddProductScreen()));
          },
          child: Text(
            kHomeScreenListViewText,
            style: kHomeScreenListViewTextStyle,
          ),
        )
      ],
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
