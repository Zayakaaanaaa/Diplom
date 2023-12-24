
import 'package:flutter/material.dart';
import 'package:grocery_store/model/cart_list.dart';
import 'package:grocery_store/pages/price_compare_screen.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/util/user.dart';
import 'package:grocery_store/widgets/bottom_navigation_container.dart';
import 'package:grocery_store/widgets/cart_items_container.dart';
import 'package:grocery_store/widgets/custom_app_bar.dart';
import 'package:grocery_store/widgets/text_button.dart';
import 'package:sizer/sizer.dart';
import '../services/grocery.dart';

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

  @override
  void initState() {
    super.initState();

    _cartItems = groceryModel.getCartProducts(userID!);
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
                  CustomTextButton(
                    text: kCartScreenButtonText,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PriceCompareScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 3.w,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar:
              BottomNavigationContainer(bottomBarIndex: bottomBarIndex)),
    );
  }
}
