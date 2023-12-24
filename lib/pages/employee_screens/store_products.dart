// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_store/widgets/custom_app_bar.dart';
import 'package:sizer/sizer.dart';
import '../../util/constants.dart';
import '../../widgets/behavior.dart';
import '../../widgets/search_text_field.dart';
import '../../widgets/store/store_product_card.dart';
import '../../widgets/store/store_product_container.dart';

class StoreProductsScreen extends StatefulWidget {
  final String storeName;
  const StoreProductsScreen({super.key, required this.storeName});

  @override
  State<StoreProductsScreen> createState() => _StoreProductsScreenState();
}

class _StoreProductsScreenState extends State<StoreProductsScreen> {
  Future<List<StoreProductCard>>? _products;

  Future<void> loadData() async {
    _products = groceryModel.getStoreProducts(widget.storeName);
    print(widget.storeName);
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
        appBar: const CustomAppBar(
          leadIcon: Icon(Icons.arrow_back),
          title: kCategoryScreenTitle,
          bgColor: kScaffoldColor,
        ),
        body: ScrollConfiguration(
          behavior: Behavior(),
          child: Container(
            padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0.w),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SearchTextField(),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: FutureBuilder<List<StoreProductCard>>(
                    future: _products,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else if (snapshot.hasData) {
                        List<StoreProductCard> _products = snapshot.data!;
                        return SingleChildScrollView(
                            child: Wrap(
                          children: [
                            StoreProductContainer(
                              productDetail: _products,
                            ),
                          ],
                        ));
                      } else {
                        return Text("No products found");
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
