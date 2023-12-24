import 'package:flutter/material.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/widgets/behavior.dart';
import 'package:grocery_store/widgets/custom_app_bar.dart';
import 'package:sizer/sizer.dart';

import '../widgets/product_card.dart';
import '../widgets/product_card_container.dart';

class CategoryItemsScreen extends StatefulWidget {
  final String docId;
  const CategoryItemsScreen({super.key, required this.docId});

  @override
  State<CategoryItemsScreen> createState() => _CategoryItemsScreenState();
}

class _CategoryItemsScreenState extends State<CategoryItemsScreen> {
  int bottomBarIndex = 2;
  Future<List<ProductDetails>>? _products;
  String? title;
  // final List<ProductDetails> _ProductDetailss = GroceryModel.getProductDetail();

  Future<void> loadData() async {
    _products = groceryModel.getCategoryProducts(widget.docId);
    title = widget.docId;
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
        appBar: CustomAppBar(
          bgColor: kScaffoldColor,
          actionIcon: Icon(Icons.filter_alt_outlined),
          title: title,
          leadIcon: Icon(Icons.arrow_back_ios_rounded),
        ),
        body: ScrollConfiguration(
          behavior: Behavior(),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, 3.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: 
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
                            ProductDetailsContainer(
                                productDetail: _products), // Adjusted
                          ],
                        ));
                  } else {
                    return Text("No products found");
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
