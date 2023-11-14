import 'package:flutter/material.dart';
import 'package:grocery_store/widgets/custom_app_bar.dart';
import 'package:sizer/sizer.dart';

import '../services/grocery.dart';
import '../util/constants.dart';
import '../widgets/store_card.dart';
import '../widgets/store_item_container.dart';

class PriceCompareScreen extends StatefulWidget {
  const PriceCompareScreen({super.key});

  @override
  State<PriceCompareScreen> createState() => _PriceCompareScreenState();
}

class _PriceCompareScreenState extends State<PriceCompareScreen> {
  @override
  final List<StoreCard> _storeDetail = GroceryModel.getStoreDetail();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Price',
          bgColor: kScaffoldColor,
          leadIcon: Icon(Icons.arrow_back),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 5.w),
          child: SingleChildScrollView(
            child: (_storeDetail == null)
                ? Container(
                    height: 25.h,
                    decoration: const BoxDecoration(color: kPrimaryColor),
                  )
                : (_storeDetail.isEmpty)
                    ? const Center(
                        child: Text("k404Text"),
                      )
                    : StoreItemContainer(
                        storeCard: _storeDetail,
                      ),
          ),
        ),
      ),
    );
  }
}
