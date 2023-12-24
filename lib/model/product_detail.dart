import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDetail {
  final String? id;
  final int catId;
  final String name;
  final String barcode;
  final String img;
  String? productDetailTitle;
  String? productDetail;
  double? nomin;
  double? sansar;
  double? emart;
  double? mmart;
  double? msuljee;
  double? carrefour;

  ProductDetail({
    this.id,
    required this.barcode,
    required this.catId,
    required this.img,
    required this.name,
    required this.productDetailTitle,
    required this.productDetail,
    this.carrefour,
    this.emart,
    this.mmart,
    this.msuljee,
    this.nomin,
    this.sansar,
  });

  factory ProductDetail.fromDocumentSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;

    return ProductDetail(
      id: doc.id,
      catId: json['catId'] ?? 0,
      name: json['name'] ?? '',
      // price: priceStores,
      barcode: json['barcode'] ?? '',
      img: json['img'] ?? '',
      productDetailTitle: json['productDetailTitle'],
      productDetail: json['productDetail'],
      emart: json['emart'],
      sansar: json['sansar'],
      mmart: json['mmart'],
      nomin: json['nomin'],
      carrefour: json['carrefour'],
      msuljee: json['msuljee'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'catId': catId,
      'name': name.toLowerCase().trim(),
      'barcode': barcode,
      'img': img,
      'productDetailTitle': productDetailTitle,
      'productDetail': productDetail,
      'emart': emart,
      'sansar': sansar,
      'mmart': mmart,
      'nomin': nomin,
      'carrefour': carrefour,
      'msuljee': msuljee,
    };
  }
}
