import 'package:flutter/material.dart';
import 'package:grocery_store/model/store.dart';

class StoreDetailScreen extends StatefulWidget {
  final StoreDetail storeDetail;

  const StoreDetailScreen({super.key, required this.storeDetail});

  @override
  State<StoreDetailScreen> createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Text(widget.storeDetail.name),
      )),
    );
  }
}
