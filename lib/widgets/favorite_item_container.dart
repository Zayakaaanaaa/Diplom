import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'favorite_card.dart';

class FavoriteItemContainer extends StatelessWidget {
  final List<FavoriteItem> favoriteItems;

  const FavoriteItemContainer({
    super.key,
    required this.favoriteItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Wrap(spacing: 5.5.w, runSpacing: 4.w, children: favoriteItems),
    );
  }
}
