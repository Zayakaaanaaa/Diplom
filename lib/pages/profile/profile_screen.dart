import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/services/grocery.dart';
import 'package:grocery_store/widgets/text_button.dart';
import 'package:sizer/sizer.dart';

import '../../model/user.dart';
import '../../widgets/user_profile.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  GroceryModel groceryModel = GroceryModel();
  Future<UserModel>? userData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<UserModel>(
          future: groceryModel.getUserData(userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              UserModel userData = snapshot.data!;
              // return Text('data');
              return Container(
                  height: 100.h,
                  width: 100.w,
                  child: UserProfile(userData: userData));
            } else {
              return Text('No user data available');
            }
          },
        ),
      ),
    );
  }
}
