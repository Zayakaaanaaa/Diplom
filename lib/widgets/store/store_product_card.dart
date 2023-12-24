import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/model/product_detail.dart';
import 'package:grocery_store/util/constants.dart';
import 'package:grocery_store/util/utils.dart';
import 'package:sizer/sizer.dart';
import '../alert_button.dart';

class StoreProductCard extends StatefulWidget {
  final String id;
  final ProductDetail productDetail;
  final String storeName;

  const StoreProductCard({
    super.key,
    required this.productDetail,
    required this.id,
    required this.storeName,
  });

  @override
  State<StoreProductCard> createState() => _StoreProductCardState();
}

class _StoreProductCardState extends State<StoreProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _editProductStorePrice(widget.storeName);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.w, 2.w, 5.w, 2.w),
        margin: EdgeInsets.symmetric(horizontal: 3.w),
        decoration: BoxDecoration(
          color: kScaffoldColor,
          border: Border(
            bottom: BorderSide(width: 1.5.sp, color: kBorderColor),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Image.network(
                    widget.productDetail.img,
                    height: 10.h,
                    width: 10.h,
                  ),
                ),
                SizedBox(
                  width: 3.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 35.w,
                      child: Text(
                        widget.productDetail.name,
                        style: kMedium12,
                      ),
                    ),
                    Text(
                      "₮${getStorePrice(widget.storeName)}",
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
  }

  double? getStorePrice(String storeName) {
    switch (storeName) {
      case 'Миний сүлжээ':
        return widget.productDetail.msuljee;
      case 'И март':
        return widget.productDetail.mmart;
      case 'М март':
        return widget.productDetail.emart;
      case 'Номин':
        return widget.productDetail.nomin;
      case 'Сансар':
        return widget.productDetail.sansar;
      case 'Carrefour':
        return widget.productDetail.carrefour;
      default:
        return 0.0;
    }
  }

  void _editProductStorePrice(String storeName) async {
    final currentPrice = getStorePrice(storeName)?.toString() ?? '';
    final newValue = await showDialog<String>(
      context: context,
      builder: (context) {
        TextEditingController textController =
            TextEditingController(text: currentPrice);
        return AlertDialog(
          title: Text(' ${widget.productDetail.name}-н үнийг өөрчлөх'),
          content: TextField(
            controller: textController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(hintText: 'Enter new price'),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AlertTextButton(
                  text: 'Цуцлах',
                  onPressed: () => Navigator.of(context).pop(),
                ),
                AlertTextButton(
                  text: 'Хадгалах',
                  onPressed: () {
                    final double? updatedPrice =
                        double.tryParse(textController.text);
                    if (updatedPrice != null) {
                      Navigator.of(context).pop();
                      setState(() {
                        updateLocalPrice(storeName, updatedPrice);
                      });
                      updateFirestorePrice(storeName, updatedPrice);
                    } else {
                      Navigator.of(context).pop();
                      Utils.showSnackBar(
                        'Please enter a valid number.',
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void updateFirestorePrice(String storeName, double newPrice) {
    String firestoreField = getFirestoreFieldName(storeName);
    if (firestoreField.isNotEmpty && widget.productDetail.id != null) {
      FirebaseFirestore.instance
          .collection('productDetails')
          .doc(widget.productDetail.id)
          .update({
        firestoreField: newPrice,
      }).then((_) {
        Utils.showSnackBar(
          'Product price updated successfully',
        );
      }).catchError((error) {
        Utils.showSnackBar(
          'Error updating product price: $error',
        );
      });
    }
  }

  String getFirestoreFieldName(String storeName) {
    switch (storeName) {
      case 'Миний сүлжээ':
        return 'msuljee';
      case 'И март':
        return 'mmart';
      case 'М март':
        return 'emart';
      case 'Номин':
        return 'nomin';
      case 'Сансар':
        return 'sansar';
      case 'Carrefour':
        return 'carrefour';
      default:
        return '';
    }
  }

  void updateLocalPrice(String storeName, double newPrice) {
    switch (storeName) {
      case 'Миний сүлжээ':
        widget.productDetail.msuljee = newPrice;
        break;
      case 'И март':
        widget.productDetail.mmart = newPrice;
        break;
      case 'М март':
        widget.productDetail.emart = newPrice;
        break;
      case 'Номин':
        widget.productDetail.nomin = newPrice;
        break;
      case 'Сансар':
        widget.productDetail.sansar = newPrice;
        break;
      case 'Carrefour':
        widget.productDetail.carrefour = newPrice;
        break;
      // Add more cases for other stores if necessary
      default:
        break;
    }
  }
}
