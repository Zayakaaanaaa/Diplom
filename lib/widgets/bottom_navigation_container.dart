import 'package:flutter/material.dart';
import 'package:grocery_store/util/user.dart';
import 'package:sizer/sizer.dart';
import '../pages/cart_screen.dart';
import '../pages/category_screen.dart';
import '../pages/favorite_screen.dart';
import '../pages/home.dart';
import '../util/constants.dart';
import '../util/utils.dart';
import 'bottom_navigation.dart';
import 'bottom_navigation_item.dart';

class BottomNavigationContainer extends StatefulWidget {
  final int bottomBarIndex;
  const BottomNavigationContainer({super.key, required this.bottomBarIndex});

  @override
  State<BottomNavigationContainer> createState() =>
      _BottomNavigationContainerState();
}

class _BottomNavigationContainerState extends State<BottomNavigationContainer> {
  String? userRole = UserPreferences.getUserRole();
  @override
  Widget build(BuildContext context) {
    return BottomNavigation(
      activeColor: kPrimaryColor,
      index: widget.bottomBarIndex,
      children: [
        BottomNavigationItem(
          active: widget.bottomBarIndex == 0 ? true : false,
          iconText: kBottomNavigationFirstText,
          icon: const Icon(Icons.storefront),
          iconSize: 21.sp,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        BottomNavigationItem(
          active: widget.bottomBarIndex == 1 ? true : false,
          iconText: kBottomNavigationSecondText,
          icon: const Icon(Icons.manage_search_rounded),
          iconSize: 21.sp,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CategoryPage()));
          },
        ),
        BottomNavigationItem(
          active: widget.bottomBarIndex == 2 ? true : false,
          iconText: kBottomNavigationThirdText,
          icon: const Icon(Icons.shopping_cart_outlined),
          iconSize: 21.sp,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartScreen()));
          },
        ),
        BottomNavigationItem(
          active: widget.bottomBarIndex == 3 ? true : false,
          iconText: kBottomNavigationFourthText,
          icon: const Icon(Icons.favorite_border_rounded),
          iconSize: 21.sp,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoriteScreen()));
          },
        ),
        BottomNavigationItem(
          active: widget.bottomBarIndex == 4 ? true : false,
          iconText: kBottomNavigationFifthText,
          icon: const Icon(Icons.account_circle_outlined),
          iconSize: 21.sp,
          onPressed: () {
            print(userRole);
            print(UserPreferences.getUser());
            switch (userRole) {
              case 'admin':
                Navigator.pushNamed(context, 'AdminProfileScreen');
                break;
              case 'employee':
                Navigator.pushNamed(context, 'EmployeeProfileScreen');
                break;
              case 'user':
                Navigator.pushNamed(context, 'UserProfileScreen');
                break;
              default:
                Utils.showSnackBar('Unknown user role encountered.');
            }
          },
        )
      ],
    );
  }
}
