import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/model/profile/store_employee.dart';
import 'package:grocery_store/pages/employee_screens/employee_profile.dart';
import 'package:sizer/sizer.dart';
import '../../util/constants.dart';

class EmployeeProfileScreen extends StatefulWidget {
  const EmployeeProfileScreen({super.key});

  @override
  State<EmployeeProfileScreen> createState() => _EmployeeProfileScreenState();
}

class _EmployeeProfileScreenState extends State<EmployeeProfileScreen> {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  Future<StoreEmployee>? employeeData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder<StoreEmployee>(
        future: groceryModel.getEmployeeData(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            StoreEmployee employeeData = snapshot.data!;
            // return Text('data');
            return Container(
                height: 100.h,
                width: 100.w,
                child: EmployeeProfile(employeeData: employeeData));
          } else {
            return Text('No user data available');
          }
        },
      )

          //  Center(
          //   child: Column(
          //     children: [
          //       Text('employee'),
          //       CustomTextButton(
          //         onPressed: () {
          //           UserPreferences.clearUser();

          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => const LoginScreen(),
          //             ),
          //           );
          //           FirebaseAuth.instance.signOut();
          //         },
          //         text: 'LogOut',
          //       ),
          //     ],
          //   ),
          // ),
          ),
    );
  }
}
