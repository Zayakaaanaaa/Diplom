import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/product_detail.dart';
import '../model/store/store.dart';
import '../services/grocery.dart';
import '../util/constants.dart';
import '../util/user.dart';
import '../widgets/category_card.dart';
import '../widgets/product_card.dart';
import '../widgets/product_card_container.dart';
import '../widgets/text_button.dart';
import 'auth/login_screen.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  Future<List<ProductDetails>>? _products;
  final List<StoreDetail> newStores = GroceryModel.addStore();
  List<CategoryCard>? categoryCards = GroceryModel.getCategoryList();

  Future<void> loadData() async {
    _products = groceryModel.getAllProducts();
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            FutureBuilder<List<ProductDetails>>(
              future: _products,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display loading indicator while data is loading
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Handle error case
                  return Text("Error: ${snapshot.error}");
                } else if (snapshot.hasData) {
                  // Data loaded successfully
                  List<ProductDetails> _products = snapshot.data!;
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        children: [
                          ProductDetailsContainer(
                              productDetail: _products), // Adjusted
                        ],
                      )
                      // ProductDetails(productDetail: _products), // Adjusted
                      );
                } else {
                  // Handle no data case
                  return Text("No products found");
                }
              },
            ),
            TextButton(
              onPressed: () async {
                for (ProductDetail product in newProducts) {
                  DocumentReference productRef = await firestore
                      .collection('productDetails')
                      .add(product.toMap());
                  String docId;
                  switch (product.catId) {
                    case 0:
                      docId = 'Мах махан бүтээгдэхүүн';
                      break;
                    case 1:
                      docId = 'Жимс хүнсний ногоо ';
                      break;
                    case 2:
                      docId = 'Сүү сүүн бүтээгдэхүүн';
                      break;
                    case 3:
                      docId = 'Цай кофе';
                      break;
                    case 4:
                      docId = 'Талх нарийн боов';
                      break;
                    case 5:
                      docId = 'Даршилсан нөөшилсөн';
                      break;
                    case 6:
                      docId = 'Шингэн бүтээгдэхүүн';
                      break;
                    case 7:
                      docId = 'Амттан';
                      break;
                    case 8:
                      docId = 'Хоол амтлагч';
                      break;
                    default:
                      docId = 'Бусад';
                  }

                  await firestore
                      .collection('category')
                      .doc(docId)
                      .collection('products')
                      .doc(productRef.id)
                      .set(product.toMap());

                  await firestore
                      .collection('category')
                      .doc(docId)
                      .set({'docId': docId}, SetOptions(merge: true));

                  await firestore
                      .collection('productDetails')
                      .doc(docId)
                      .set({'id': docId}, SetOptions(merge: true));
                }
                print('success');
              },
              child: Text('Add prodcut'),
            ),
            TextButton(
              onPressed: () async {
                for (StoreDetail store in newStores) {
                  await firestore.collection('stores').add(store.toMap());
                }
                print('success');
              },
              child: Text('Add store'),
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
    );
  }
}
