import 'package:flutter/material.dart';
import 'package:grocery_store/model/store/store.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:sizer/sizer.dart';

import '../widgets/store/store_branch_container.dart';
import '../widgets/store/store_review_container.dart';

class StoreDetailScreen extends StatefulWidget {
  final StoreDetail storeDetail;

  const StoreDetailScreen({super.key, required this.storeDetail});

  @override
  State<StoreDetailScreen> createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
  StoreDetail? store;

  Future<void> loadData() async {
    store = widget.storeDetail;
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
        body: Container(
          child: Stack(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(5.w))),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset(
                    store!.img,
                    width: 100.w,
                    height: 35.h,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(2.5.w, 5.w, 0.w, 0.w),
                child: IconButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: 25.sp,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 35.h),
                padding: EdgeInsets.all(5.w),
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.w),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        store!.name,
                        style: kSemibold22,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'Холбоо барих : ',
                            style: kSemibold15,
                          ),
                          SizedBox(
                            width: 2.h,
                          ),
                          Icon(Icons.phone, color: kPrimaryColor, size: 25),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            store!.phone,
                            style: kMedium12,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Салбарууд',
                        style: kSemibold15,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      StoreBranchContainer(branches: store!.brances),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Зураг',
                            style: kSemibold18,
                          ),
                          Text(
                            'Бүгдийг харах',
                            style: kRegular12,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        child: Wrap(
                          spacing: 2.w,
                          runSpacing: 2.w,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.w)),
                              clipBehavior: Clip.hardEdge,
                              width: 40.w,
                              child: Image.network(
                                store!.images[0],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.w)),
                              clipBehavior: Clip.hardEdge,
                              width: 40.w,
                              child: Image.network(
                                store!.images[1],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.w)),
                              clipBehavior: Clip.hardEdge,
                              width: 50.w,
                              child: Image.network(store!.images[2]),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      StoreReviewContainer(reviews: store!.reviews),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
