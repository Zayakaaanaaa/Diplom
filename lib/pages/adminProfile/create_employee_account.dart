// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/widgets/custom_app_bar.dart';
import 'package:sizer/sizer.dart';
import '../../util/constants.dart';
import '../../util/employee.dart';
import '../../util/utils.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/text_button.dart';

class CreateEmployee extends StatefulWidget {
  const CreateEmployee({super.key});

  @override
  State<CreateEmployee> createState() => _CreateEmployeeState();
}

class _CreateEmployeeState extends State<CreateEmployee> {
  String? role;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  String? selectedStore;
  Future<List<String>>? _stores;

  Future<void> loadData() async {
    _stores = groceryModel.getStoresNames();
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
        appBar: CustomAppBar(
          title: 'Ажилтны хаяг үүсгэх',
          center: false,
        ),
        body: Container(
          padding: EdgeInsets.all(5.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      hintText: 'Ажилтны нэрийг оруулна уу',
                      icon: false,
                      label: 'Ажилтны нэр*',
                      controller: _usernameController,
                      obScure: false,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    CustomTextField(
                      hintText: 'Ажилтны цахим хаягийг оруулна уу',
                      icon: false,
                      label: 'Ажилтны цахим шуудан',
                      controller: _emailController,
                      obScure: false,
                      inputType: false,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    CustomTextField(
                        hintText: 'Нууц үг оруулна уу',
                        icon: true,
                        label: 'Нууц үг',
                        controller: _passwordController,
                        obScure: true),
                    SizedBox(
                      height: 3.h,
                    ),
                    CustomTextField(
                      hintText: 'Утасны дугаарыг оруулна уу',
                      icon: true,
                      label: 'Утас',
                      controller: _phoneController,
                      obScure: false,
                      inputType: true,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Text(
                        'Ажилтны дэлгүүрийг сонгоно уу.',
                        style: kSemibold12,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    FutureBuilder<List<String>>(
                      future: _stores,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }

                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Text('No data available');
                        }

                        // Create a dropdown menu item list from snapshot data
                        var storeDropdownItems = snapshot.data
                            ?.map<DropdownMenuItem<String>>(
                                (storeName) => DropdownMenuItem(
                                      value: storeName,
                                      child: Text(storeName),
                                    ))
                            .toList();

                        // Return the DropdownButton
                        return Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                            color: kScaffoldColor,
                            border: Border.all(
                                width: 0.5.sp,
                                color: kInputDecorationBorderColor),
                            borderRadius: BorderRadius.circular(10.w),
                            boxShadow: kBoxShadow,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text(
                                'Select Store',
                                style: kInputDecorationHintStyle,
                              ),
                              icon: Icon(Icons.arrow_drop_down_rounded),
                              iconSize: 45,
                              elevation: 16,
                              value: selectedStore,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedStore = newValue;
                                });
                              },
                              items: storeDropdownItems,
                            ),
                          ),
                        );
                      },
                    ),
                    // CustomTextField(
                    //     hintText: 'Нууц үг дахин оруулна уу',
                    //     icon: true,
                    //     label: 'Нууц үг давтах',
                    //     controller: _rePasswordController,
                    //     obScure: true),
                    // SizedBox(
                    //   height: 3.h,
                    // ),
                  ],
                ),
                CustomTextButton(
                    text: 'Ажилтныг бүртгэх',
                    onPressed: () {
                      createEmployee(context);
                      // createEmployee(context);
                    }),
                SizedBox(height: 4.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future createEmployee(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      String employeeId = userCredential.user!.uid;

      Map<String, dynamic> userData = {
        "email": _emailController.text.trim(),
        "password": _passwordController.text.trim(),
      };

      await FirebaseFirestore.instance
          .collection('storeEmployee')
          .doc(employeeId)
          .set(userData);

      EmployeePreferences.setEmployee(employeeId);

      Map<String, dynamic> profileData = {
        "id": employeeId,
        "email": _emailController.text.trim(),
        "password": _passwordController.text.trim(),
        "username": _usernameController.text.trim(),
        "phoneNumber": _phoneController.text.trim(),
        "storeName": selectedStore,
      };

      await firestore.collection('storeEmployee').doc(employeeId).set(
            profileData,
            SetOptions(merge: true),
          );

      Utils.showSnackBar('Амжилттай үүсгэлээ');
      Navigator.pushNamed(context, 'AdminProfileScreen');
    } on FirebaseAuthException catch (error) {
      print('--------------------------------');
      print(error);
      Utils.showSnackBar(error
          .message); // Assuming Utils is a utility class you have for showing snack bars
    } catch (e) {
      print('ssssssssssssssssssssssssss');
      print(e);
      Utils.showSnackBar(e.toString());
    }
  }
}
