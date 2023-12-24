// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/model/profile/store_employee.dart';
import 'package:grocery_store/pages/employee_screens/barcode.dart';
import 'package:grocery_store/pages/employee_screens/store_products.dart';
import 'package:grocery_store/widgets/alert_button.dart';
import 'package:grocery_store/widgets/bottom_navigation_container.dart';
import 'package:sizer/sizer.dart';

import '../../util/constants.dart';
import '../../util/user.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/text_button.dart';
import '../auth/login_screen.dart';

class EmployeeProfile extends StatefulWidget {
  final StoreEmployee employeeData;
  const EmployeeProfile({super.key, required this.employeeData});

  @override
  State<EmployeeProfile> createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile> {
  String? employeeId;
  String? storeName;

  Future<void> loadData() async {
    employeeId = UserPreferences.getUser();
  }

  @override
  void initState() {
    loadData();
    // EmployeePreferences.setEmployeeStore(widget.employeeData.storeName);
    // storeName = EmployeePreferences.getEmployeeStore();
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
                        backgroundImage:
                            NetworkImage(widget.employeeData.photoUrl),
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
                        subtitle: Text(widget.employeeData.username),
                        onTap: () {
                          _editEmployeeInfo(
                              'username', widget.employeeData.username);
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
                        subtitle: Text(widget.employeeData.email),
                        onTap: () {
                          _editEmployeeInfo('email', widget.employeeData.email);
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
                        subtitle: Text(widget.employeeData.phoneNumber),
                        onTap: () {
                          _editEmployeeInfo(
                              'phoneNumber', widget.employeeData.phoneNumber);
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.phone,
                          size: 19.sp,
                        ),
                        title: Text(
                          "Дэлгүүр",
                          style: kPrimary13,
                        ),
                        subtitle: Text(widget.employeeData.storeName),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.phone,
                          size: 19.sp,
                        ),
                        title: Text(
                          "Бүтээгдэхүүн нэмэх",
                          style: kPrimary13,
                        ),
                        subtitle: Text(widget.employeeData.storeName),
                        onTap: () {
                          print(widget.employeeData.storeName);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BarcodeImagePage(
                                storeName: widget.employeeData.storeName,
                              ),
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StoreProductsScreen(
                                storeName: widget.employeeData.storeName,
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.list, // Changed to a list icon
                            size: 19.sp,
                          ),
                          title: Text(
                            "Бүтээгдэхүүн",
                            style: kPrimary13,
                          ),
                          subtitle: Text(widget.employeeData.storeName),
                        ),
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

  void _editEmployeeInfo(String field, String currentValue) async {
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
        switch (field.toLowerCase()) {
          case 'username':
            widget.employeeData.username = newValue;
            break;
          case 'email':
            widget.employeeData.email = newValue;
            break;
          case 'phonenumber':
            widget.employeeData.phoneNumber = newValue;
            break;
        }
      });

      Map<String, String> fieldMap = {
        'username': 'username',
        'email': 'email',
        'phonenumber': 'phoneNumber',
      };

      String firestoreField = fieldMap[field.toLowerCase()] ?? field;

      FirebaseFirestore.instance
          .collection('storeEmployee')
          .doc(employeeId)
          .update({
        firestoreField: newValue,
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating info: $error'),
            backgroundColor: Colors.red,
          ),
        );
      });
    }
  }
}
