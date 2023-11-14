import 'package:flutter/material.dart';
import 'package:grocery_store/model/category.dart';
import 'package:grocery_store/pages/category_items_screen.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:sizer/sizer.dart';

class CategoryCard extends StatelessWidget {
  final CategoryList categoryList;

  const CategoryCard({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CategoryItemsScreen()));
      },
      child: Container(
        padding: EdgeInsets.all(2.h),
        // color: Colors.red,
        height: 22.h,
        width: 20.h,
        decoration: BoxDecoration(
          color: categoryList.catColor.withOpacity(0.25),
          border: Border.all(width: 2.sp, color: categoryList.catColor),
          borderRadius: BorderRadius.circular(5.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              categoryList.img,
              height: 20.w,
            ),
            Text(
              categoryList.name,
              style: kMedium12,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }
}
