// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/widgets/custom_app_bar.dart';
import 'package:grocery_store/widgets/icon_container.dart';
import 'package:grocery_store/widgets/text_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:path/path.dart' as path;

import '../../widgets/custom_text_field.dart';

class ProductAdd extends StatefulWidget {
  final String barcode;
  final String? storeName;
  const ProductAdd({super.key, required this.barcode, required this.storeName});

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  final _productName = TextEditingController();
  final _productDetailControll = TextEditingController();
  final _priceController = TextEditingController();
  List<String> categories = groceryModel.getCategoryNames();
  File? image;
  String selectedCategory = "Жимс хүнсний ногоо";
  String? store;
  String? imageURL;

  Future<void> pickImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();

    try {
      final XFile? pickedImage =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        setState(() {
          image = File(pickedImage.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<String> uploadImageToFirebaseStorage(File? imageFile) async {
    if (imageFile == null) {
      // Handle the case where no image is selected.
      return "";
    }

    try {
      String fileName = path.basename(imageFile.path);
      Reference storageReference =
          FirebaseStorage.instance.ref().child('product_images/$fileName');
      UploadTask uploadTask = storageReference.putFile(imageFile);

      await uploadTask.whenComplete(() => null);

      // Get the download URL for the uploaded image.
      String imageUrl = await storageReference.getDownloadURL();

      return imageUrl;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Шинэ бүтээгдэхүүн',
          leadIcon: Icon(Icons.arrow_back_rounded),
          bgColor: kScaffoldColor,
        ),
        body: Container(
          padding: EdgeInsets.all(5.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  hintText: 'Бүтээгдэхүүний нэрийг оруулна уу',
                  icon: false,
                  label: 'Бүтээгдэхүүний нэр*',
                  controller: _productName,
                  obScure: false,
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextField(
                  hintText: 'Бүтээгдэхүүний мэдээлэл',
                  icon: false,
                  label: 'Бүтээгдэхүүний мэдээллийг оруулна уу',
                  controller: _productDetailControll,
                  obScure: false,
                  inputType: false,
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextField(
                  hintText: 'Бүтээгдэхүүний үнийг оруулна уу',
                  icon: true,
                  label: 'Үнэ',
                  controller: _priceController,
                  obScure: false,
                  inputType: true,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    color: kScaffoldColor,
                    border: Border.all(
                        width: 0.5.sp, color: kInputDecorationBorderColor),
                    borderRadius: BorderRadius.circular(10.w),
                    boxShadow: kBoxShadow,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedCategory,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategory = newValue!;
                        });
                      },
                      items: categories
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                GestureDetector(
                  onTap: () {
                    pickImageFromGallery();
                  },
                  child: IconContainer(
                      icon: Icons.folder, text: 'Бүтээгдэхүүний зураг'),
                ),
                CustomTextButton(
                    text: 'Бүртгэх',
                    onPressed: () async {
                      print(_productName.text);
                      print(_productDetailControll.text);

                      print(_priceController.text);

                      print(_productDetailControll.text);
                      print(widget.barcode);
                      print(widget.storeName);

                      saveProduct();
                      // uploadImageToFirebaseStorage(image, context);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> saveProduct() async {
    int catId;

    switch (selectedCategory) {
      case 'Мах махан бүтээгдэхүүн':
        catId = 0;
        break;
      case 'Жимс хүнсний ногоо ':
        catId = 1;
        break;
      case 'Сүү сүүн бүтээгдэхүүн':
        catId = 2;
        break;
      case 'Цай кофе':
        catId = 3;
        break;
      case 'Талх нарийн боов':
        catId = 4;
        break;
      case 'Даршилсан нөөшилсөн':
        catId = 5;
        break;
      case 'Шингэн бүтээгдэхүүн':
        catId = 6;
        break;
      case 'Амттан':
        catId = 7;
        break;
      case 'Хоол амтлагч':
        catId = 8;
        break;
      default:
        catId = 9;
    }
    // imageURL = await uploadImageToFirebaseStorage(image);

    // ProductDetail temp = ProductDetail(
    //   barcode: widget.barcode,
    //   catId: catId,
    //   img: imageURL!,
    //   name: _productName.text.trim(),
    //   productDetailTitle: 'Тайлбар',
    //   productDetail: _productDetailControll.text.trim(),
    // );

    String? imageURL = await uploadImageToFirebaseStorage(image);

    // Create a Map to hold product data
    Map<String, dynamic> productData = {
      "name": _productName.text.trim(),
      "productDetail": _productDetailControll.text.trim(),
      "price": _priceController.text.trim(),
      "productDetailTitle": 'Тайлбар',
      "catId": catId,
      "img": imageURL,
      widget.storeName!: getPrice(),
      "barcode": widget.barcode,
      "id": '',
    };

    // Add product data to Firestore
    try {
      await firestore.collection('productDetails').add(productData);
    } catch (e) {
      print('Error adding product to Firestore: $e');
    }
  }

  double getPrice() {
    String priceText = _priceController.text.trim();
    if (priceText.isEmpty) {
      return 0.0;
    } else {
      try {
        double price = double.parse(priceText);
        return price;
      } catch (e) {
        return 0.0;
      }
    }
  }
}
