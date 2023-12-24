// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:sizer/sizer.dart';
import 'dart:async';

import '../model/product_detail.dart';
import '../util/constants.dart';
import '../widgets/product_card.dart';
import 'detail_screen.dart';
/// MySearchScreen нь хэрэглэгчид бүтээгдэхүүн хайх боломжийг олгодог StatefulWidget юм.
/// Бүтээгдэхүүний дэлгэрэнгүй мэдээллийг Firestore-оос авах ба хайлтын үр дүнг дэлгэцэнд харуулахад ашигладаг.
class MySearchScreen extends StatefulWidget {
  @override
  _MySearchScreenState createState() => _MySearchScreenState();
}


class _MySearchScreenState extends State<MySearchScreen> {
  TextEditingController searchController = TextEditingController();// Хайлтын текстийг хянах контроллер.
  List<ProductDetail> searchResults = [];// Хайлтын үр дүнг хадгалах жагсаалт.
  Future<ProductDetails>? barcodeScan;// Баркод сканнерийн ирээдүйн хариу.
  String barcode = 'Unknown';// Баркодын утга.

  Timer? searchDebounce;

  @override
  void initState() {
    super.initState();
  }

  void searchProduct(String query) async {
    String searchQuery = query.toLowerCase().trim();
    if (query.isEmpty) {
      setState(() {
        searchResults = [];
      });
      return;
    } // Хайлтын логик энд бичигдсэн.

    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('productDetails')
          .orderBy('name')
          .startAt([searchQuery]).endAt([searchQuery + '\uf8ff']).get();

      List<ProductDetail> results = snapshot.docs
          .map((doc) => ProductDetail.fromDocumentSnapshot(
              doc)) // Step 2: Use the model's constructor
          .toList();

      setState(() {
        searchResults = results;
      });
    } catch (error) {
      print('Error searching products: $error');
    }
  }

  void onSearchChanged(String query) {
    if (searchDebounce?.isActive ?? false) searchDebounce!.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 500), () {
      searchProduct(query.trim());
    });
  }// Хайлтын текст өөрчлөгдөхөд ажиллагаа энд бичигдсэн.

  @override
  Widget build(BuildContext context) {
    double containerHeight;
    if (searchResults.isEmpty) {
      containerHeight = 11.h; // Height for no search results
    } else if (searchResults.length == 1) {
      containerHeight = 20.h; 
    } else {
      containerHeight = (searchResults.length * 16.h)
          .clamp(10.h, 60.h); 
    }
    return Container(
      height: containerHeight,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: kHomeScreenHintText,
                hintStyle: kHomeScreenHintTextStyle, // Your hint text style
                filled: true,
                fillColor: kTextFieldColor,
                suffixIcon: IconButton(
                  icon: Icon(Icons.barcode_reader),
                  onPressed: () {
                    scanBarcode();
                  },
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      3.w), // Adjust the border radius as needed
                  borderSide: BorderSide.none, // No border side
                ),
              ),
              onChanged: onSearchChanged,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final product = searchResults[index];
                return GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          id: product.id!,
                          productDetail: product,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5.w, 2.w, 5.w, 2.w),
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    decoration: BoxDecoration(
                        color: kScaffoldColor,
                        border: Border(
                          bottom:
                              BorderSide(width: 1.5.sp, color: kBorderColor),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Image.network(
                                product.img, // Use ProductDetail property
                                height: 8.h,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 35.w,
                                  child: Text(
                                    product.name, // Use ProductDetail property
                                    style: kMedium12,
                                  ),
                                ),
                                Text(
                                  ("₮${product.emart}"), // Use ProductDetail property
                                  style: kMedium12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }// UI-ийн харуулж буй хэсэг энд бичигдсэн.

  Future<void> scanBarcode() async {
    try {
      final barcodeResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Line color
        'Cancel', // Cancel button text
        true, // Show flash icon
        ScanMode.BARCODE, // Scan mode
      );

      // If the barcode scanner is dismissed, '-1' is returned.
      if (barcodeResult == '-1') {
        print('Failed to get barcode!');
        return;
      }

      if (!mounted) return;

      setState(() {
        barcode = barcodeResult;
      });

      try {
        ProductDetails barcodeScan =
            await groceryModel.getBarcodeProduct(barcode);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: barcodeScan.id,
              productDetail: barcodeScan.productDetail,
            ),
          ),
        );
      } catch (e) {
        print('Error getting product details: $e');
      }
    } catch (e) {
      print('Error scanning barcode: $e');
    }
  }    // Баркод сканнерийн логик энд бичигдсэн.

  @override
  void dispose() {
    searchController.dispose();
    searchDebounce?.cancel();
    super.dispose();
  }
}
