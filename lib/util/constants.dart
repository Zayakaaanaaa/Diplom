import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../services/grocery.dart';

// final GlobalKey<HomePage> khomeScreenKey = GlobalKey();

const google_api_key = "AIzaSyC3fDSJW4tNfnqrhuzPlGFF-fjuMbJKG6g";
const kHomeScreenLocationText = "Байршил";
const kHomeScreenHintText = "Хайлт";
const kHomeScreenCategoriesText = "Ангилал";
const kHomeScreenListViewText = "Бүгдийг харах";
const kHomeScreenShopListText = "Дэлгүүр";
const kBottomNavigationFirstText = "Нүүр";
const kBottomNavigationSecondText = "Хайх";
const kBottomNavigationThirdText = "Сагс";
const kBottomNavigationFourthText = "Дуртай";
const kBottomNavigationFifthText = "Профайл";
const kCategoryScreenTitle = "Бүтээгдэхүүн хайх";
const k404Text = "Бүтээгдэхүүн олдсонгүй";
const kCartScreenTitle = 'Миний бүтээгдэхүүн';
const kCartScreenButtonText = 'Үнэ харьцуулах';
const kFavoriteScreenButtonText = 'Бүгдийг сагсанд нэмэх';
const kFavoriteScreenTitle = 'Хадгалсан бүтээгдэхүүн';
const kSplashScreenText = 'NECTAR';
const kOnboardingText = 'Тавтай морил';
const kOnboardingButtonText = 'Эхлүүлэх';
const kLoginScreenText = "Нэвтрэх";
const kLoginScreenText1 = 'Цахим шуудан болон нууц үгээ оруулна уу';
const kSignUpText = "Бүртгүүлэх";
const kSignUpText1 = 'Хэрэглэгчийн мэдээллээ оруулна уу';
const kEmailText = 'Цахим шуудан';
const kPasswordText = 'Нууц үг';
const kForgetPassword = 'Нүүц үгээ мартсан?';
const kProfileScreenTitle = 'Хувийн мэдээлэл';
const kUploadPhotoTitle = 'Зургаа оруулна уу';
const kProfileScreenText = 'Энэ мэдээллийг таны профайлд харуулах болно';

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
    color:
        kPrimaryColor.withOpacity(0.15), // Shadow color with some transparency
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
final kSemibold22 = TextStyle(
  fontSize: 22.sp,
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
    overflow: TextOverflow.clip);

final kRegular12Black = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.w400,
  color: kCategoryTextColor,
);

final kRegularGrey12 = TextStyle(
  fontSize: 10.sp,
  fontWeight: FontWeight.w300,
  color: kSearchHintTextColor,
);

final kRegular12 = TextStyle(
    fontSize: 10.sp, fontWeight: FontWeight.w300, color: Colors.black);

final kPrimary12 = TextStyle(
    fontSize: 10.sp, fontWeight: FontWeight.w500, color: kPrimaryColor);

final kPrimary13 = TextStyle(
    fontSize: 13.sp, fontWeight: FontWeight.w500, color: kPrimaryColor);
final kRegular10 = TextStyle(
  fontSize: 10.sp,
  fontWeight: FontWeight.w300,
  color: Colors.black,
);

final kMedium12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: kCategoryTextColor,
    overflow: TextOverflow.fade);

final kMediumGrey12 = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.w500,
  color: kSearchHintTextColor,
);
final kMediumGrey10 = TextStyle(
  fontSize: 10.sp,
  fontWeight: FontWeight.w500,
  color: kSearchHintTextColor,
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
final kSemiboldBlack12 = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.w600,
  color: Colors.black,
);

final kSemibold15 = TextStyle(
  fontSize: 15.sp,
  fontWeight: FontWeight.w600,
  color: Colors.black,
);

final kCongratsStyle = TextStyle(
  fontSize: 18.sp,
  fontWeight: FontWeight.w500,
  color: kPrimaryColor,
);

typedef CounterChangedCallback = void Function(int newCount);
final FirebaseFirestore firestore = FirebaseFirestore.instance;
final GroceryModel groceryModel = GroceryModel();
