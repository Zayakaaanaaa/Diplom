// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/model/profile/user.dart';
import 'package:grocery_store/widgets/alert_button.dart';
import 'package:grocery_store/widgets/custom_app_bar.dart';
import 'package:sizer/sizer.dart';
// import '../../model/product_detail.dart';
// import '../../model/store/store.dart';
import '../../widgets/bottom_navigation_container.dart';
import '../auth/login_screen.dart';
// import '../../services/grocery.dart';
import '../../util/constants.dart';
import '../../util/user.dart';
import '../../widgets/text_button.dart';

class UserProfile extends StatefulWidget {
  final UserModel userData;
  const UserProfile({super.key, required this.userData});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late bool isMale;

  void _toggleGender() {
    setState(() {
      isMale = !isMale;
    });
  }

  @override
  void initState() {
    isMale = widget.userData.gender == "Male"; // Initialize based on
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          leadIcon: Icon(
            Icons.arrow_back_rounded,
            size: 19.sp,
          ),
          bgColor: kScaffoldColor,
          title: 'Хувийн мэдээлэл',
          center: false,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(5.w, 2.w, 5.w, 5.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 17.w,
                        backgroundImage: NetworkImage(widget.userData.photoURL),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.account_circle_outlined,
                          size: 19.sp,
                        ),
                        title: Text(
                          "Нэр",
                          style: kPrimary13,
                        ),
                        subtitle: Text(widget.userData.fullName),
                        onTap: () {
                          _editUserInfo('name', widget.userData.fullName);
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.email_rounded,
                          size: 19.sp,
                        ),
                        title: Text(
                          "Цахим шуудан",
                          style: kPrimary13,
                        ),
                        subtitle: Text(widget.userData.email),
                        onTap: () {
                          _editUserInfo('email', widget.userData.email);
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.phone,
                          size: 19.sp,
                        ),
                        title: Text(
                          "Утасны дугаар",
                          style: kPrimary13,
                        ),
                        subtitle: Text(widget.userData.phoneNumber),
                        onTap: () {
                          _editUserInfo(
                              'phoneNumber', widget.userData.phoneNumber);
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          isMale ? Icons.male : Icons.female,
                          size: 19.sp,
                        ),
                        title: Text(
                          "Хүйс",
                          style: kPrimary13,
                        ),
                        trailing: Switch(
                          activeColor: kPrimaryColor,
                          inactiveThumbColor: kPrimaryColor,
                          inactiveTrackColor: kPrimaryColor.withOpacity(0.5),
                          value: isMale,
                          onChanged: (value) {
                            _toggleGender();
                          },
                        ),
                        subtitle: Text(isMale ? "Эрэгтэй" : "Эмэгтэй"),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.location_on,
                          size: 19.sp,
                        ),
                        title: Text(
                          "Хаяг",
                          style: kPrimary13,
                        ),
                        subtitle: Text(widget.userData.address),
                        onTap: () {
                          _editUserInfo('address', widget.userData.address);
                        },
                      ),
                    ],
                  ),
                ),
                CustomTextButton(
                  onPressed: () {
                    UserPreferences.clearUser();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                    FirebaseAuth.instance.signOut();
                  },
                  text: 'LogOut',
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationContainer(bottomBarIndex: 4),
      ),
    );
  }

  void _editUserInfo(String field, String currentValue) async {
    final newValue = await showDialog<String>(
      context: context,
      builder: (context) {
        TextEditingController textController =
            TextEditingController(text: currentValue);
        return AlertDialog(
          title: Text('Edit $field'),
          content: TextField(controller: textController),
          actions: [
            AlertTextButton(
              text: 'Cancel',
              onPressed: () => Navigator.of(context).pop(),
            ),
            AlertTextButton(
              text: 'Save',
              onPressed: () => Navigator.of(context).pop(textController.text),
            ),
          ],
        );
      },
    );

    if (newValue != null && newValue != currentValue) {
      setState(() {
        // Map the input field to the UserModel field
        switch (field.toLowerCase()) {
          case 'name':
            widget.userData.fullName = newValue;
            break;
          case 'email':
            widget.userData.email = newValue;
            break;
          case 'address':
            widget.userData.address = newValue;
            break;
          case 'phonenumber':
            widget.userData.phoneNumber = newValue;
            break;
          default:
            // Handle other fields or add an error case as necessary
            break;
        }
      });

      // Create a map to convert the input field to the Firestore field name
      Map<String, String> fieldMap = {
        'name': 'fullName',
        'email': 'email',
        'address': 'address',
        'phonenumber': 'phoneNumber',
      };

      // Use the fieldMap to get the correct Firestore field
      String firestoreField = fieldMap[field.toLowerCase()] ?? field;

      FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userData.id)
          .update({
        firestoreField: newValue,
      }).catchError((error) {
        // Handle any errors here
        print('Error updating user info: $error');
      });
    }
  }
}
