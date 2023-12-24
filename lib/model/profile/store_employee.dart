import 'package:cloud_firestore/cloud_firestore.dart';

class StoreEmployee {
  String id;
  String storeName;
  String email;
  String phoneNumber;
  String password;
  String photoUrl;
  String username;

  StoreEmployee({
    required this.id,
    required this.username,
    required this.storeName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.photoUrl,
  });

  factory StoreEmployee.fromDocumentSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    return StoreEmployee(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      storeName: json['storeName'] ?? '',
      password: json['password'] ?? '',
      photoUrl: json['photoUrl'] ?? '',
    );
  }
}
