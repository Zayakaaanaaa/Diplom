import 'package:flutter/material.dart';
import 'package:grocery_store/pages/home.dart';
import 'package:grocery_store/widgets/text_button.dart';
import 'package:sizer/sizer.dart';

import '../../util/constants.dart';
import '../../util/user.dart';
import '../../widgets/custom_app_bar.dart';

class CongratScreen extends StatelessWidget {
  CongratScreen({super.key});

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
                Image.asset('assets/icons/accepted.gif', height: 30.h),
                SizedBox(height: 4.h),
                Text('Congrats!', style: kCongratsStyle),
                SizedBox(height: 4.h),
                Text('Your profile ready to use', style: kRegular12)
              ],
            ),
            CustomTextButton(
                text: 'Үргэлжлүүлэх',
                onPressed: () {
                  UserPreferences.setUserRole('user');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                })
          ],
        ),
      ),
    ));
  }
}
