class ProductDetail {
  final int id;
  final int catId;
  final String name;
  final double price;
  final String size;
  final String barcode;
  final String img;
  String? productDetailTitle;
  String? productDetail;
  String? nutritionTitle;
  String? nutritionDetail;

  ProductDetail(
      {required this.id,
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
}
