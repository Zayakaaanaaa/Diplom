import 'package:flutter/material.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/widgets/behavior.dart';
import 'package:grocery_store/widgets/custom_app_bar.dart';
import 'package:sizer/sizer.dart';

import '../services/grocery.dart';
import '../widgets/product_card.dart';
import '../widgets/product_card_container.dart';

class CategoryItemsScreen extends StatefulWidget {
  const CategoryItemsScreen({super.key});

  @override
  State<CategoryItemsScreen> createState() => _CategoryItemsScreenState();
}

class _CategoryItemsScreenState extends State<CategoryItemsScreen> {
  int bottomBarIndex = 2;
  final List<ProductDetails> _ProductDetailss = GroceryModel.getProductDetail();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          bgColor: kScaffoldColor,
          actionIcon: Icon(Icons.filter_alt_outlined),
          title: kCategoryItemsScreenTitle,
          leadIcon: Icon(Icons.arrow_back_ios_rounded),
        ),
        body: ScrollConfiguration(
          behavior: Behavior(),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, 3.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: (_ProductDetailss == null)
                  ? Container(
                      height: 25.h,
                      decoration: const BoxDecoration(color: kPrimaryColor))
                  : (_ProductDetailss.isEmpty)
                      ? const Center(
                          child: Text("k404Text"),
                        )
                      : ProductDetailsContainer(
                          productDetail: _ProductDetailss,
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
