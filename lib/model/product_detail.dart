import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_store/model/store_price.dart';

class ProductDetail {
  final int? id;
  final int catId;
  final String name;
  final List<PriceStores> price;
  final String size;
  final String barcode;
  final String img;
  String? productDetailTitle;
  String? productDetail;
  String? nutritionTitle;
  String? nutritionDetail;

  ProductDetail(
      {this.id,
      required this.barcode,
      required this.catId,
      required this.img,
      required this.name,
      required this.size,
      required this.productDetailTitle,
      required this.productDetail,
      required this.nutritionDetail,
      required this.nutritionTitle,
      required this.price});

  factory ProductDetail.fromDocumentSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;

    // Assuming 'price' is a list of maps
    List<PriceStores> priceStores = (json['price'] as List)
        .map((priceJson) =>
            PriceStores.fromMap(priceJson as Map<String, dynamic>))
        .toList();

    return ProductDetail(
      id: int.tryParse(doc.id) ??
          0, // Assuming you want to convert the document ID to int
      catId: json['catId'] ?? 0,
      name: json['name'] ?? '',
      price: priceStores,
      size: json['size'] ?? '',
      barcode: json['barcode'] ?? '',
      img: json['img'] ?? '',
      productDetailTitle: json['productDetailTitle'],
      productDetail: json['productDetail'],
      nutritionTitle: json['nutritionTitle'],
      nutritionDetail: json['nutritionDetail'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'catId': catId,
      'name': name,
      'price': price.map((p) => p.toMap()).toList(),
      'size': size,
      'barcode': barcode,
      'img': img,
      'productDetailTitle': productDetailTitle,
      'productDetail': productDetail,
      'nutritionTitle': nutritionTitle,
      'nutritionDetail': nutritionDetail,
    };
  }
}


// }
