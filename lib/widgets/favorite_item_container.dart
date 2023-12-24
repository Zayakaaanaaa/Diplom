import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../model/cart_list.dart';
import 'favorite_card.dart';

class FavoriteItemContainer extends StatelessWidget {
  final Future<List<CartProduct>> favoriteItems;

  const FavoriteItemContainer({
    super.key,
    required this.favoriteItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: FutureBuilder<List<CartProduct>>(
        future: favoriteItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show a loader while waiting
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); // Show error message
          } else if (snapshot.hasData) {
            return Wrap(
              spacing: 5.5.w,
              runSpacing: 4.w,
              children: snapshot.data!
                  .map((favoriteItems) =>
                      FavoriteItem(favoriteItems: favoriteItems))
                  .toList(),
            );
          } else {
            return Text(
                'No items in the Favorite List'); // Handle no data scenario
          }
        },
      ),
    );
  }
}
