import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool _isMale = false;
  bool _isFemale = false;

  final _fullnameController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _phoneController = TextEditingController();
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
        body: SingleChildScrollView(
          child: Container(
            height: 85.h,
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
                  inputType: true,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Text(
                        'Gender *',
                        style: kSemibold12,
                      ),
                    ),
                    SizedBox(
                      height: 0.8.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                          color: kScaffoldColor,
                          border: Border.all(
                              width: 0.5.sp,
                              color: kInputDecorationBorderColor),
                          borderRadius: BorderRadius.circular(10.w),
                          boxShadow: kBoxShadow),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 35.w,
                            child: CheckboxListTile(
                              activeColor: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    50.h), // Adjust the radius here
                              ),
                              title: const Text('Male'),
                              value: _isMale,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isMale = value!;
                                  if (_isMale) {
                                    _isFemale = false;
                                  }
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 35.w,
                            child: CheckboxListTile(
                              activeColor: kPrimaryColor,
                              title: const Text('Female'),
                              value: _isFemale,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isFemale = value!;
                                  if (_isFemale) {
                                    _isMale = false;
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => _selectDate(context),
                  child: IgnorePointer(
                    child: CustomTextField(
                      hintText: 'date',
                      icon: false,
                      label: 'Date of Birth *',
                      controller: _dateController,
                      obScure: false,
                    ),
                  ),
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
                      saveProfileInformation();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => UploadPhotoScreen(),
                      //   ),
                      // );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> saveProfileInformation() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    String gender = _isMale ? 'Male' : (_isFemale ? 'Female' : '');

    Map<String, dynamic> profileData = {
      "fullName": _fullnameController.text.trim(),
      "nickname": _nicknameController.text.trim(),
      "phoneNumber": _phoneController.text.trim(),
      "gender": gender,
      "dateOfBirth": _dateController.text.trim(),
      "address": _addressController.text.trim(),
    };

    await FirebaseFirestore.instance.collection('users').doc(userId).set(
          profileData,
          SetOptions(merge: true),
        );

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UploadPhotoScreen()));
  }
}
