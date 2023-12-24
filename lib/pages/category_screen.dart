import 'package:flutter/material.dart';
import 'package:grocery_store/pages/test_search.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/widgets/bottom_navigation_container.dart';
import 'package:grocery_store/widgets/category_card.dart';
import 'package:grocery_store/widgets/category_card_container.dart';
import 'package:grocery_store/widgets/custom_app_bar.dart';
import 'package:sizer/sizer.dart';
import '../services/grocery.dart';
import '../widgets/behavior.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    int bottomBarIndex = 1;
    List<CategoryCard>? categoryCards = GroceryModel.getCategoryList();

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
                    child: MySearchScreen(),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Expanded(
                    child: (categoryCards == null)
                        ? Container(
                            height: 25.h,
                            decoration:
                                const BoxDecoration(color: kPrimaryColor))
                        : (categoryCards.isEmpty)
                            ? const Center(
                                child: Text("k404Text"),
                              )
                            : CategoryCardContainer(
                                categoryCards: categoryCards,
                              ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar:
              BottomNavigationContainer(bottomBarIndex: bottomBarIndex)),
    );
  }
}
