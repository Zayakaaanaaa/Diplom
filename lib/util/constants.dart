import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../services/grocery.dart';

// final GlobalKey<HomePage> khomeScreenKey = GlobalKey();

const google_api_key = "AIzaSyC3fDSJW4tNfnqrhuzPlGFF-fjuMbJKG6g";
const kHomeScreenLocationText = "location";
const kHomeScreenHintText = "Search Store";
const kHomeScreenCategoriesText = "Categories";
const kHomeScreenListViewText = "See all";
const kHomeScreenShopListText = "Stores";
const kBottomNavigationFirstText = "Shop";
const kBottomNavigationSecondText = "Explore";
const kBottomNavigationThirdText = "Cart";
const kBottomNavigationFourthText = "Favorite";
const kBottomNavigationFifthText = "Account";
const kCategoryScreenTitle = "Find Products";
const k404Text = "Products not found";
const kCategoryItemsScreenTitle = 'Oils';
const kCartScreenTitle = 'My Cart';
const kCartScreenButtonText = 'Go to ChechOut';
const kFavoriteScreenButtonText = 'Add All To Cart';
const kFavoriteScreenTitle = 'Favorite';
const kSplashScreenText = 'NECTAR';
const kOnboardingText = 'Welcome to our store';
const kOnboardingButtonText = 'Get Started';
const kLoginScreenText = "Loging";
const kLoginScreenText1 = 'Enter your emails and password';
const kSignUpText = "Sign Up";
const kSignUpText1 = 'Enter your crendentials to continue';
const kEmailText = 'Email';
const kPasswordText = 'Password';
const kForgetPassword = 'Forgot Password?';
const kProfileScreenTitle = 'Fill in your bio';
const kUploadPhotoTitle = 'Upload your photo';
const kProfileScreenText =
    'This data will be displayed in your account profile for security';

const kPrimaryColor = Color(0xff38D683);
const kPrimaryGradient = LinearGradient(
  colors: [Color(0XFF43DD86), Color(0XFF27CA7D)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
const kSplashColor = Color(0xff24C87C);
const kTextShadowColor = Color(0x4D000000);
const kScaffoldColor = Color(0xffFFFFFF);
const konBoardingColor = Color.fromARGB(255, 190, 180, 180);
const kHomeScreenLocationColor = Color(0xff4C4F4D);
const kInactiveButtonColor = Color(0xff181725);
const kTextFieldColor = Color(0xffF2F3F2);
const kSearchHintTextColor = Color(0xff7C7C7C);
const kCategoryTextColor = Color(0xff181725);
const kBorderColor = Color(0XffE2E2E2);
const kIconColor = Color(0XFF181725);
const kButtonTextColor = Color(0xffFFF9FF);
const kInActiveFavoriteButtonColor = Color(0xff7C7C7C);
const kInputDecorationBorderColor = Color(0xffDADEE3);

final kUser = FirebaseAuth.instance.currentUser!;
final navigatorKey = GlobalKey<NavigatorState>();

final kBoxShadow = [
  BoxShadow(
    color: Colors.blue.withOpacity(0.1), // Shadow color with some transparency
    spreadRadius: 5, // Extend the shadow to all sides by 1 unit
    blurRadius: 7, // Blur radius for the shadow
    offset: const Offset(0, 3), // Position of the shadow
  ),
];

final kSizedBoxHeight = SizedBox(
  height: 2.h,
);

final kSplashScreenTextStyle = TextStyle(
  fontSize: 30.sp,
  fontWeight: FontWeight.w600,
  color: kScaffoldColor,
);

final kHomeScreenHintTextStyle = TextStyle(
  fontSize: 10.sp,
  fontWeight: FontWeight.w400,
  color: kSearchHintTextColor,
);

final kInputDecorationHintStyle = TextStyle(
  fontSize: 10.sp,
  fontWeight: FontWeight.w400,
  color: kInputDecorationBorderColor,
);

final kHomeScreenLocationTextStyle = TextStyle(
  fontSize: 14.sp,
  fontWeight: FontWeight.bold,
  color: kHomeScreenLocationColor,
);

final kSemibold18 = TextStyle(
  fontSize: 18.sp,
  fontWeight: FontWeight.w500,
  color: kCategoryTextColor,
);

final kHomeScreenListViewTextStyle = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.w500,
  color: kPrimaryColor,
);

final kProductDetailsNameTextStyle = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.w500,
  color: kCategoryTextColor,
);

final kRegular12 = TextStyle(
  fontSize: 10.sp,
  fontWeight: FontWeight.w300,
  color: kSearchHintTextColor,
);

final kMedium12 = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.w500,
  color: kCategoryTextColor,
);

final kButtonTextStyle = TextStyle(
  fontSize: 16.sp,
  fontWeight: FontWeight.w300,
  color: kButtonTextColor,
);

final kCategoryTextStyle = TextStyle(
  fontSize: 18.sp,
  fontWeight: FontWeight.w500,
  color: kCategoryTextColor,
);

final kOnboardingTextStyle = TextStyle(
  fontSize: 28.sp,
  fontWeight: FontWeight.w600,
  color: kScaffoldColor,
);
final kSemibold12 = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.w600,
  color: kSearchHintTextColor,
);

final kCongratsStyle = TextStyle(
  fontSize: 18.sp,
  fontWeight: FontWeight.w500,
  color: kPrimaryColor,
);

typedef CounterChangedCallback = void Function(int newCount);
final FirebaseFirestore firestore = FirebaseFirestore.instance;
final  GroceryModel groceryModel = GroceryModel();


