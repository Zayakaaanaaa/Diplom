class CartProduct {
  final int cartId;
  final String name;
  final String img;
  final String subName;
  final double price;
  final int quantity;

  CartProduct(
      {required this.cartId,
      required this.img,
      required this.name,
      required this.subName,
      required this.price,
      required this.quantity});
}
