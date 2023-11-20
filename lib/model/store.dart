import 'package:grocery_store/model/store_sector.dart';

class StoreDetail {
  final int storeId;
  final String name;
  final String img;
  final String address;
  final String phone;
  final List<StoreSector> sectors;
  final double? price;

  StoreDetail(
      {required this.storeId,
      required this.img,
      required this.name,
      required this.address,
      required this.phone,
      required this.sectors,
      this.price});
}
