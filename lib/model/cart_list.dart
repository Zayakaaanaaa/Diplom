import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_store/model/product_detail.dart';
import 'package:grocery_store/model/store.dart';

class CartProduct {
  String product;
  String prodcutDocId;
  int quantity;

  CartProduct(
      {required this.product,
      required this.quantity,
      required this.prodcutDocId});

  Map<String, dynamic> toMap() {
    return {
      'product': product,
      'quantity': quantity,
      'prodcutDocId': prodcutDocId,
    };
  }

  factory CartProduct.fromDocumentSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;

    return CartProduct(
      prodcutDocId: json['prodcutDocId'],
      product: json['product'],
      quantity: json['quantity'],
    );
  }
}
