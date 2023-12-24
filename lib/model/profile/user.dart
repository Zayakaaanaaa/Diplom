import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String fullName;
  String email;
  String phoneNumber;
  final String gender;
  final String nickname;
  final String dateOfBirth;
  String address;
  final String photoURL;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.nickname,
    required this.dateOfBirth,
    required this.address,
    required this.photoURL,
  });

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      gender: json['gender'] ?? '',
      nickname: json['nickname'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      address: json['address'] ?? '',
      photoURL: json['photoURL'] ?? '',
    );
  }
}
