import 'package:flutter/material.dart';
import 'package:grocery_store/pages/profile/upload_photo_screen.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/widgets/custom_app_bar.dart';
import 'package:grocery_store/widgets/custom_text_field.dart';
import 'package:grocery_store/widgets/text_button.dart';
import 'package:sizer/sizer.dart';

class ProfileInformationScreen extends StatefulWidget {
  const ProfileInformationScreen({super.key});

  @override
  State<ProfileInformationScreen> createState() =>
      _ProfileInformationScreenState();
}

class _ProfileInformationScreenState extends State<ProfileInformationScreen> {
  final _fullnameController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _genderController = TextEditingController();
  final _dateController = TextEditingController();
  final _addressController = TextEditingController();

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
            const Text(kProfileScreenText),
            CustomTextField(
              hintText: 'Enter your full name',
              icon: false,
              label: 'Full Name *',
              controller: _fullnameController,
              obScure: false,
            ),
            CustomTextField(
              hintText: 'Enter your nickname',
              icon: false,
              label: 'Nick Name *',
              controller: _nicknameController,
              obScure: false,
            ),
            CustomTextField(
              hintText: 'phone number',
              icon: false,
              label: 'Phone Number  *',
              obScure: false,
              controller: _phoneController,
            ),
            CustomTextField(
              hintText: 'select your gender',
              icon: false,
              label: 'Gender *',
              controller: _genderController,
              obScure: false,
            ),
            CustomTextField(
              hintText: 'date',
              icon: false,
              label: 'Date of Birth *',
              controller: _dateController,
              obScure: false,
            ),
            CustomTextField(
              hintText: 'Enter your address',
              icon: false,
              label: 'Address*',
              obScure: false,
              controller: _addressController,
            ),
            CustomTextButton(
                text: 'Next',
                onPressed: () {
                  print('Done');
                   Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  UploadPhotoScreen()));
              
                })
          ],
        ),
      ),
    ));
  }
}
