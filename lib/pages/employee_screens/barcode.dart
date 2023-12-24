// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:grocery_store/pages/employee_screens/product_add.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/widgets/custom_text_field.dart';
import 'package:grocery_store/widgets/icon_container.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/alert_button.dart';

class BarcodeImagePage extends StatefulWidget {
  final String storeName;

  const BarcodeImagePage({Key? key, required this.storeName}) : super(key: key);

  @override
  _BarcodeImagePageState createState() => _BarcodeImagePageState();
}

class _BarcodeImagePageState extends State<BarcodeImagePage> {
  String barcode = 'Unknown';
  bool isProductFound = false;
  final _priceController = TextEditingController();
  String? productDocId;
  String? store;

  Future<void> scanBarcode() async {
    try {
      final barcodeResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );

      if (!mounted) return;

      if (barcodeResult != '-1') {
        // Perform a query in the Firestore database
        var querySnapshot = await FirebaseFirestore.instance
            .collection('productDetails')
            .where('barcode', isEqualTo: barcodeResult)
            .get();

        if (querySnapshot.docs.isEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductAdd(
                barcode: barcodeResult,
                storeName: getName(),
              ),
            ),
          );
        } else {
          var document = querySnapshot.docs.first;
          setState(() {
            barcode = 'Barcode found: $barcodeResult';
            isProductFound = true;
            productDocId = document.id;
            showCancelBookingDialog(context);
          });
        }
      } else {
        setState(() {
          barcode = 'Barcode not found: $barcodeResult';
        });
      }
    } catch (e) {
      setState(() {
        barcode = 'Failed to get barcode!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner Example'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Бүтээгдэхүүний бар кодыг уншуулна уу:',
                textAlign: TextAlign.center,
                style: kSemibold15,
              ),
              SizedBox(
                height: 5.h,
              ),
              GestureDetector(
                onTap: () {
                  scanBarcode();
                },
                child:
                    IconContainer(icon: Icons.barcode_reader, text: 'Бар код'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showCancelBookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text(
            'Бүтээгдэхүүн бүртгэх',
            style: TextStyle(
              color: Colors.blue, // Replace with your desired color
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'нмэраибөртоёыль',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: 'Бүтээгдэхүүний үнийг оруулна уу',
                icon: false,
                label: 'Үнэ',
                controller: _priceController,
                obScure: false,
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AlertTextButton(
                    text: 'Буцах',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  AlertTextButton(
                    text: 'Тийм',
                    onPressed: () {
                      savePrice();
                      print('done');
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  String getName() {
    String store;
    switch (widget.storeName) {
      case 'Сансар':
        store = 'sansar';
        break;
      case 'И март':
        store = 'emart';
        break;
      case 'Carrefour':
        store = 'carrefour';
        break;
      case 'Миний сүлжээ':
        store = 'msuljee';
        break;
      case 'М март':
        store = 'mmart';
        break;
      case 'Номин':
        store = 'nomin';
        break;
      default:
        store = 'Бусад';
    }
    return store;
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

  Future<void> savePrice() async {
    await FirebaseFirestore.instance
        .collection('productDetails')
        .doc(productDocId)
        .update(
      {getName(): getPrice()},
    );
    Navigator.of(context).pop();
    print(widget.storeName);
    print(_priceController.text.trim());
    print(store!);
  }
}
