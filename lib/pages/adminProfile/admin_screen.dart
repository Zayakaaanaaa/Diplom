// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/pages/adminProfile/create_employee_account.dart';
import 'package:grocery_store/pages/adminProfile/registered_employees.dart';
import 'package:sizer/sizer.dart';

import '../../util/constants.dart';
import '../../util/user.dart';
import '../../widgets/bottom_navigation_container.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/text_button.dart';
import '../auth/login_screen.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 17.w,
                      backgroundImage: NetworkImage(
                          'https://w7.pngwing.com/pngs/306/70/png-transparent-computer-icons-management-admin-silhouette-black-and-white-neck-thumbnail.png'),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.store_mall_directory_rounded,
                        size: 19.sp,
                      ),
                      title: Text(
                        "Бүртгэлтэй дэлгүүрүүд",
                        style: kSemiboldBlack12,
                      ),
                    ),
                    Divider(
                      color: kBorderColor,
                      thickness: 1.sp,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.add_business_rounded,
                        size: 19.sp,
                      ),
                      title: Text(
                        "Дэлгүүр нэмэх",
                        style: kSemiboldBlack12,
                      ),
                    ),
                    Divider(
                      color: kBorderColor,
                      thickness: 1.sp,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisteredEmployees(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.account_circle_rounded,
                          size: 19.sp,
                        ),
                        title: Text(
                          "Бүртгэлтэй ажилтангууд",
                          style: kSemiboldBlack12,
                        ),
                      ),
                    ),
                    Divider(
                      color: kBorderColor,
                      thickness: 1.sp,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateEmployee(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.person_add_alt_1_rounded,
                          size: 19.sp,
                        ),
                        title: Text(
                          "Ажилтны хаяг үүсгэх",
                          style: kSemiboldBlack12,
                        ),
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
        bottomNavigationBar: BottomNavigationContainer(bottomBarIndex: 4),
      ),
    );
  }
}
