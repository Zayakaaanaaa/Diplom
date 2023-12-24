import 'package:flutter/material.dart';
import 'package:grocery_store/widgets/custom_app_bar.dart';
import 'package:sizer/sizer.dart';
import '../util/constants.dart';
import '../widgets/store/store_card.dart';
import '../widgets/store/store_item_container.dart';


class PriceCompareScreen extends StatefulWidget {
  const PriceCompareScreen({super.key});

  @override
  State<PriceCompareScreen> createState() => _PriceCompareScreenState();
}

class _PriceCompareScreenState extends State<PriceCompareScreen> {
  Future<List<StoreCard>>? _stores;

  Future<void> loadData() async {
    _stores = groceryModel.getStores(false);
  }

  @override
  void initState() {
    loadData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Price',
          bgColor: kScaffoldColor,
          leadIcon: Icon(Icons.arrow_back),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 5.w),
          child: FutureBuilder<List<StoreCard>>(
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
        ),
      ),
    );
  }
}
