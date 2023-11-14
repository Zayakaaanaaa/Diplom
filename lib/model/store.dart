class StoreDetail {
  final int storeId;
  final String name;
  final String img;
  final String address;
  final String phone;
  final double? price;

  StoreDetail(
      {required this.storeId,
      required this.img,
      required this.name,
      required this.address,
      required this.phone,
      this.price});
}
