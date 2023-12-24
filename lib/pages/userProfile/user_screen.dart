import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:sizer/sizer.dart';

import '../../model/profile/user.dart';
import 'user_profile.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String userId = FirebaseAuth.instance.currentUser!.uid;
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
              return GestureDetector(
                  onTap: () {
                    print(userId);
                  },
                  child: Text('Error: ${snapshot.error}ssss'));
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
