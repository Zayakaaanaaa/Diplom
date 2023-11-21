import 'package:cloud_firestore/cloud_firestore.dart';

class PriceStores {
  final int storeId;
  final double price;

  PriceStores({
    required this.storeId,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'storeId': storeId,
      'price': price,
    };
  }

  factory PriceStores.fromMap(Map<String, dynamic> json) {
    return PriceStores(
      storeId: json['storeId'] as int,
      price: (json['price'] as num).toDouble(),
    );
  }
  PriceStores getCheapestPrice(List<PriceStores> prices) {
    if (prices.isEmpty) {
      throw Exception('Price list is empty');
    }

    PriceStores cheapest = prices[0];
    for (PriceStores priceStore in prices) {
      if (priceStore.price < cheapest.price) {
        cheapest = priceStore;
      }
    }

    return cheapest;
  }
}
