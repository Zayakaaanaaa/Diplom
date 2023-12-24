import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/model/profile/store_employee.dart';
import 'package:grocery_store/widgets/behavior.dart';
import 'package:sizer/sizer.dart';
import '../../util/constants.dart';
import '../../widgets/bottom_navigation_container.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/search_text_field.dart';

class RegisteredEmployees extends StatefulWidget {
  const RegisteredEmployees({super.key});

  @override
  State<RegisteredEmployees> createState() => _RegisteredEmployeesState();
}

class _RegisteredEmployeesState extends State<RegisteredEmployees> {
  Stream<List<StoreEmployee>>? employeesStream;

  @override
  void initState() {
    super.initState();
    // Initialize the stream
    employeesStream = groceryModel.getEmployees();
  }

  Future<void> deleteEmployee(String documentId) async {
    try {
      // Delete the employee from Firestore
      await FirebaseFirestore.instance
          .collection('storeEmployee')
          .doc(documentId)
          .delete();

      // Update the state to reflect the change
      setState(() {
        // Reinitialize the stream to get the updated list of employees
        employeesStream = groceryModel.getEmployees();
      });
    } catch (e) {
      // Handle errors, e.g., show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting employee: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          leadIcon: Icon(Icons.arrow_back_ios_rounded),
          bgColor: kScaffoldColor,
          title: 'Бүртгэлтэй ажилтангууд',
        ),
        body: ScrollConfiguration(
          behavior: Behavior(),
          child: Container(
            padding: EdgeInsets.fromLTRB(5.w, 2.w, 5.w, 5.w),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: const SearchTextField(),
                ),
                SizedBox(height: 5.h),
                Expanded(
                  child: StreamBuilder<List<StoreEmployee>>(
                    stream: employeesStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var employee = snapshot.data![index];
                            return Container(
                              margin: EdgeInsets.only(bottom: 3.w),
                              child: ListTile(
                                leading: Image.network(
                                  employee.photoUrl,
                                  width: 15.w,
                                ),
                                title: Text(
                                  employee.storeName,
                                  style: kPrimary13,
                                ),
                                subtitle: Text(employee.username),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.close_rounded,
                                    size: 20.sp,
                                    color: kPrimaryColor,
                                  ),
                                  onPressed: () {
                                    deleteEmployee(employee.id);
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return Text('No employees found');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationContainer(bottomBarIndex: 4),
      ),
    );
  }
}
