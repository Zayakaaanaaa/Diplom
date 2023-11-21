import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_store/model/store_sector.dart';

class StoreDetail {
  final int storeId;
  final String name;
  final String img;
  final String address;
  final String phone;
  // final double? price;

  StoreDetail({
    required this.storeId,
    required this.img,
    required this.name,
    required this.address,
    required this.phone,
  });

  factory StoreDetail.fromDocumentSnapshotMap(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;

    return StoreDetail(
      storeId: json['storeId'],
      name: json['name'],
      img: json['img'],
      address: json['address'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'storeId': storeId,
      'name': name,
      'img': img,
      'address': address,
      'phone': phone,
    };
  }
}
