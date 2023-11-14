import 'package:flutter/material.dart';

class CategoryList {
  final int catId;
  final String name;
  final String img;
  final Color catColor;

  CategoryList({
    required this.catId,
    required this.img,
    required this.name,
    required this.catColor,
  });
}
