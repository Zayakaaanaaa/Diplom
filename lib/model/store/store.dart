import 'package:cloud_firestore/cloud_firestore.dart';

import 'review.dart';

import 'branch.dart';

class StoreDetail {
  final int storeId;
  final String name;
  final String img;
  final List<Branch> brances;
  final List<String> images;
  final String phone;
  final List<Review> reviews;

  StoreDetail({
    required this.storeId,
    required this.img,
    required this.name,
    required this.brances,
    required this.phone,
    required this.images,
    required this.reviews,
  });

  factory StoreDetail.fromDocumentSnapshotMap(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;

    return StoreDetail(
      storeId: json['storeId'],
      name: json['name'],
      img: json['img'],
      brances: (json['brances'] as List).map((e) => Branch.fromMap(e)).toList(),
      phone: json['phone'],
      images: List<String>.from(json['images']),
      reviews: (json['reviews'] as List).map((e) => Review.fromMap(e)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'storeId': storeId,
      'name': name,
      'img': img,
      'brances': brances.map((b) => b.toMap()).toList(),
      'phone': phone,
      'images': images,
      'reviews': reviews.map((r) => r.toMap()).toList(),
    };
  }
}
