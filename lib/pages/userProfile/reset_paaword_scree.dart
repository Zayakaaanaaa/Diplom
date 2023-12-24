import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../util/constants.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/icon_container.dart';
import '../../widgets/text_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
                  IconContainer(
                      icon: Icons.camera_alt_rounded, text: 'Take photo'),
                ],
              ),
              CustomTextButton(text: 'Next', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
