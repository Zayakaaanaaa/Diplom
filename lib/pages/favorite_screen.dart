import 'package:flutter/material.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/widgets/behavior.dart';
import 'package:grocery_store/widgets/bottom_navigation_container.dart';
import 'package:grocery_store/widgets/custom_app_bar.dart';
import 'package:grocery_store/widgets/favorite_item_container.dart';
import 'package:grocery_store/widgets/text_button.dart';
import 'package:sizer/sizer.dart';
import '../model/cart_list.dart';
import '../services/grocery.dart';
import '../util/user.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  int bottomBarIndex = 3;

  String? userID = UserPreferences.getUser();
  Future<List<CartProduct>>? _favoriteItems;
  GroceryModel groceryModel = GroceryModel();
  @override
  Future<void> loadData() async {
    _favoriteItems = groceryModel.getFavoriteProducts(userID!);
  }

  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const CustomAppBar(
            leadIcon: Icon(Icons.arrow_back),
            title: kFavoriteScreenTitle,
            bgColor: kScaffoldColor,
          ),
          body: Container(
            padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0.w),
            child: ScrollConfiguration(
              behavior: Behavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    (_favoriteItems == null)
                        ? Container(
                            height: 25.h,
                            decoration:
                                const BoxDecoration(color: kPrimaryColor))
                        : FavoriteItemContainer(
                            favoriteItems: _favoriteItems!,
                          ),
                    CustomTextButton(
                      text: kFavoriteScreenButtonText,
                      onPressed: () {
                        print('hello');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar:
              BottomNavigationContainer(bottomBarIndex: bottomBarIndex)),
    );
  }
}
