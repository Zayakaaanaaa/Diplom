import 'package:flutter/material.dart';
import 'package:grocery_store/pages/userProfile/location_screen.dart';
import 'package:grocery_store/widgets/text_button.dart';
import 'package:sizer/sizer.dart';

import '../../util/constants.dart';
import '../../widgets/custom_app_bar.dart';

class UploadPhotoS extends StatelessWidget {
  const UploadPhotoS({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
        leadIcon: Icon(Icons.arrow_back_ios_new_rounded),
        title: kProfileScreenTitle,
        bgColor: kScaffoldColor,
      ),
      body: Container(
        padding: EdgeInsets.all(5.w),
        margin: EdgeInsets.only(bottom: 5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(kProfileScreenText),
                SizedBox(height: 4.h),
                Container(
                  height: 25.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50.h)),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    'assets/stores/pro.webp',
                    height: 30.h,
                  ),
                )
              ],
            ),
            CustomTextButton(
                text: 'Next',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LocationScreen()));
                })
          ],
        ),
      ),
    ));
  }
}
