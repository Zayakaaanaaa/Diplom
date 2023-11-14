import 'package:flutter/material.dart';
import 'package:grocery_store/model/cart_list.dart';
import 'package:grocery_store/model/product_detail.dart';
import 'package:grocery_store/model/store.dart';
import 'package:grocery_store/widgets/category_card.dart';
import 'package:grocery_store/widgets/product_card.dart';

import '../model/category.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/favorite_card.dart';
import '../widgets/store_card.dart';

List<ProductDetails> listItems = [
  ProductDetails(
    productDetail: ProductDetail(
      id: 1,
      barcode: 'asda ',
      catId: 5,
      img: 'assets/images/oil.png',
      name: '11111111111',
      price: 512,
      size: "2dfs",
      productDetailTitle: 'fsdfw',
      productDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetail',
      nutritionDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetailproductDetail',
      nutritionTitle: 'productDetail',
    ),
  ),
  ProductDetails(
    productDetail: ProductDetail(
      id: 1,
      barcode: 'asda ',
      catId: 5,
      img: 'assets/images/oil.png',
      name: '11111111111',
      price: 512,
      size: "2dfs",
      productDetailTitle: 'fsdfw',
      productDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetail',
      nutritionDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetailproductDetail',
      nutritionTitle: 'productDetail',
    ),
  ),
  ProductDetails(
    productDetail: ProductDetail(
      id: 1,
      barcode: 'asda ',
      catId: 5,
      img: 'assets/images/oil.png',
      name: '11111111111',
      price: 512,
      size: "2dfs",
      productDetailTitle: 'fsdfw',
      productDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetail',
      nutritionDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetailproductDetail',
      nutritionTitle: 'productDetail',
    ),
  ),
  ProductDetails(
    productDetail: ProductDetail(
      id: 1,
      barcode: 'asda ',
      catId: 5,
      img: 'assets/images/oil.png',
      name: '11111111111',
      price: 512,
      size: "2dfs",
      productDetailTitle: 'fsdfw',
      productDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetail',
      nutritionDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetailproductDetail',
      nutritionTitle: 'productDetail',
    ),
  ),
  ProductDetails(
    productDetail: ProductDetail(
      id: 1,
      barcode: 'asda ',
      catId: 5,
      img: 'assets/images/oil.png',
      name: '11111111111',
      price: 512,
      size: "2dfs",
      productDetailTitle: 'fsdfw',
      productDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetail',
      nutritionDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetailproductDetail',
      nutritionTitle: 'productDetail',
    ),
  ),
  ProductDetails(
    productDetail: ProductDetail(
      id: 1,
      barcode: 'asda ',
      catId: 5,
      img: 'assets/images/oil.png',
      name: '11111111111',
      price: 512,
      size: "2dfs",
      productDetailTitle: 'fsdfw',
      productDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetail',
      nutritionDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetailproductDetail',
      nutritionTitle: 'productDetail',
    ),
  ),
];

List<FavoriteItem> favoriteItems = [
  FavoriteItem(
    favoriteItems: CartProduct(
        cartId: 1,
        img: 'assets/images/meat.png',
        name: 'Meat',
        subName: '1kg,Price',
        price: 4.99,
        quantity: 5),
  ),
  FavoriteItem(
    favoriteItems: CartProduct(
        cartId: 1,
        img: 'assets/images/meat.png',
        name: 'Meat',
        subName: '1kg,Price',
        price: 4.99,
        quantity: 5),
  ),
  FavoriteItem(
    favoriteItems: CartProduct(
        cartId: 1,
        img: 'assets/images/meat.png',
        name: 'Meat',
        subName: '1kg,Price',
        price: 4.99,
        quantity: 5),
  ),
  FavoriteItem(
    favoriteItems: CartProduct(
        cartId: 1,
        img: 'assets/images/meat.png',
        name: 'Meat',
        subName: '1kg,Price',
        price: 4.99,
        quantity: 5),
  ),
  FavoriteItem(
    favoriteItems: CartProduct(
        cartId: 1,
        img: 'assets/images/meat.png',
        name: 'Meat',
        subName: '1kg,Price',
        price: 4.99,
        quantity: 5),
  ),
  FavoriteItem(
    favoriteItems: CartProduct(
        cartId: 1,
        img: 'assets/images/meat.png',
        name: 'Meat',
        subName: '1kg,Price',
        price: 4.99,
        quantity: 5),
  )
];

List<CartItem> cartItems = [
  CartItem(
    cartItem: CartProduct(
        cartId: 1,
        img: 'assets/images/meat.png',
        name: 'Meat',
        subName: '1kg,Price',
        price: 4.99,
        quantity: 5),
  ),
  CartItem(
    cartItem: CartProduct(
        cartId: 1,
        img: 'assets/images/meat.png',
        name: 'Meat',
        subName: '1kg,Price',
        price: 4.99,
        quantity: 5),
  ),
  CartItem(
    cartItem: CartProduct(
        cartId: 1,
        img: 'assets/images/meat.png',
        name: 'Meat',
        subName: '1kg,Price',
        price: 4.99,
        quantity: 5),
  ),
  CartItem(
    cartItem: CartProduct(
        cartId: 1,
        img: 'assets/images/meat.png',
        name: 'Meat',
        subName: '1kg,Price',
        price: 4.99,
        quantity: 5),
  ),
  CartItem(
    cartItem: CartProduct(
        cartId: 1,
        img: 'assets/images/meat.png',
        name: 'Meat',
        subName: '1kg,Price',
        price: 4.99,
        quantity: 5),
  ),
  CartItem(
    cartItem: CartProduct(
        cartId: 1,
        img: 'assets/images/meat.png',
        name: 'Meat',
        subName: '1kg,Price',
        price: 4.99,
        quantity: 5),
  )
];

List<CategoryCard> categoryItems = [
  CategoryCard(
    categoryList: CategoryList(
        catId: 0,
        img: 'assets/images/meat.png',
        name: 'Meat & Fish',
        catColor: const Color(0xffF7A593)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 1,
        img: 'assets/images/fruits.png',
        name: 'Fresh Fruits & Vegetable',
        catColor: const Color(0xff53B175)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 2,
        img: 'assets/images/oil.png',
        name: 'Cooking Oil & Ghee',
        catColor: const Color(0xffF8A44C)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 4,
        img: 'assets/images/bread.png',
        name: 'Bakery & Snack',
        catColor: const Color(0xffD3B0E0)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 5,
        img: 'assets/images/eggs.png',
        name: 'Dairy & Eggs',
        catColor: const Color(0xffFDE598)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 6,
        img: 'assets/images/beverages.png',
        name: 'Beverages',
        catColor: const Color(0xffB7DFF5)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 7,
        img: 'assets/images/household.jpg',
        name: 'HouseHold',
        catColor: const Color(0xff8B91A0)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 8,
        img: 'assets/images/petcare.png',
        name: 'Pet Care',
        catColor: const Color(0xff8B91A0)),
  ),
];

List<StoreCard> storeList = [
  StoreCard(
    storeCards: StoreDetail(
        address: 'gjernwmle,f;wopemf',
        storeId: 0,
        img: 'assets/stores/emart.jpg',
        phone: '12345678',
        name: 'Emart',
        price: 5.98),
  ),
  StoreCard(
    storeCards: StoreDetail(
        address: 'gjernwmle,f;wopemf',
        storeId: 0,
        img: 'assets/stores/carrefour.png',
        phone: '12345678',
        name: 'Carrefour',
        price: 6.1),
  ),
  StoreCard(
    storeCards: StoreDetail(
        address: 'gjernwmle,f;wopemf',
        storeId: 0,
        img: 'assets/stores/minii.png',
        phone: '12345678',
        name: 'Minii suljee',
        price: 6.5),
  ),
  StoreCard(
    storeCards: StoreDetail(
        address: 'gjernwmle,f;wopemf',
        storeId: 0,
        img: 'assets/stores/mmart.png',
        phone: '12345678',
        name: 'M mart',
        price: 5.74),
  ),
  StoreCard(
    storeCards: StoreDetail(
        address: 'gjernwmle,f;wopemf',
        storeId: 0,
        img: 'assets/stores/nomin.png',
        phone: '12345678',
        name: 'Nomin',
        price: 7.1),
  ),
  StoreCard(
    storeCards: StoreDetail(
        address: 'gjernwmle,f;wopemf',
        storeId: 0,
        img: 'assets/stores/sansar.jpg',
        phone: '12345678',
        name: 'Sansar',
        price: 6.6),
  ),
];

class GroceryModel {
  // Future<ProductDetails> getProductDetail({
  //   required int id,
  // }) async {
  //   ProductDetails temp;

  //   for (int i = 0; i < listItems.length; i++) {
  //     if (listItems[i].id == id) {
  //       temp = listItems[i];
  //     }
  //   }

  //   return Future.value(ProductDetails(
  //       id: id,
  //       barcode: "barcode",
  //       catId: 1,
  //       img: "img",
  //       name: "name",
  //       size: "size",
  //       productDetail: "productDetail",
  //       price: 23));
  // }
  static List<ProductDetails> getProductDetail() {
    List<ProductDetails> temp = [];
    for (int i = 0; i < listItems.length; i++) {
      temp.add(listItems[i]);
    }
    return temp;
  }

  static List<CategoryCard> getCategoryList() {
    List<CategoryCard> temp = [];
    for (int i = 0; i < categoryItems.length; i++) {
      temp.add(categoryItems[i]);
    }
    return temp;
  }

  static List<CartItem> getCartItems() {
    List<CartItem> temp = [];
    for (int i = 0; i < cartItems.length; i++) {
      temp.add(cartItems[i]);
    }
    return temp;
  }

  static List<FavoriteItem> getFavoriteItems() {
    List<FavoriteItem> temp = [];
    for (int i = 0; i < favoriteItems.length; i++) {
      temp.add(favoriteItems[i]);
    }
    return temp;
  }

  static List<StoreCard> getStoreDetail() {
    List<StoreCard> temp = [];
    for (int i = 0; i < storeList.length; i++) {
      temp.add(storeList[i]);
    }
    return temp;
  }

  // static List<ProductCard> getProducts() {
  //   List<ProductCard> temp = [];
  //   temp.add(
  //     ProductCard(
  //       ProductDetail: ProductDetail(
  //           id: 1,
  //           barcode: 'asda',
  //           catId: 1,
  //           img: 'assets/images/oil.png',
  //           name: 'Red Apple',
  //           size: 'sofmsi',
  //           productDetail: 'goy',
  //           price: 423),
  //     ),
  //   );
  //   temp.add(
  //     ProductCard(
  //       ProductDetail: ProductDetail(
  //           id: 2,
  //           barcode: 'asda',
  //           catId: 1,
  //           img: 'assets/images/logo.png',
  //           name: 'medku',
  //           size: 'sofmsi',
  //           productDetail: 'goy',
  //           price: 423),
  //     ),
  //   );
  //   temp.add(
  //     ProductCard(
  //       ProductDetail: ProductDetail(
  //           id: 3,
  //           barcode: 'asda',
  //           catId: 1,
  //           img: 'assets/images/logo.png',
  //           name: 'medku',
  //           size: 'sofmsi',
  //           productDetail: 'goy',
  //           price: 423),
  //     ),
  //   );
  //   temp.add(
  //     ProductCard(
  //       ProductDetail: ProductDetail(
  //           id: 4,
  //           barcode: 'asda',
  //           catId: 1,
  //           img: 'assets/images/logo.png',
  //           name: 'medku',
  //           size: 'sofmsi',
  //           productDetail: 'goy',
  //           price: 423),
  //     ),
  //   );
  //   temp.add(
  //     ProductCard(
  //       ProductDetail: ProductDetail(
  //           id: 5,
  //           barcode: 'asda',
  //           catId: 1,
  //           img: 'assets/images/logo.png',
  //           name: 'medku',
  //           size: 'sofmsi',
  //           productDetail: 'goy',
  //           price: 423),
  //     ),
  //   );
  //   temp.add(
  //     ProductCard(
  //       ProductDetail: ProductDetail(
  //           id: 6,
  //           barcode: 'asda',
  //           catId: 1,
  //           img: 'assets/images/logo.png',
  //           name: 'medku',
  //           size: 'sofmsi',
  //           productDetail: 'goy',
  //           price: 423),
  //     ),
  //   );

  //   return temp;
  // }

  static List<String> getCarouselItems() {
    List<String> temp = [];
    temp.add(
        'https://sunrisemarketplace.com/wp-content/uploads/2017/09/SMP-grocery-stores-banner.jpg');
    temp.add(
        'https://previews.123rf.com/images/wdnet/wdnet1806/wdnet180600047/105364144-healthy-eating-and-green-grocery-shopping-banner-group-of-selected-fresh-vegetables-on-abstract.jpg');
    temp.add(
        'https://media.istockphoto.com/id/1071027802/photo/fresh-vegetables-on-blurred-abstract-background.jpg?s=612x612&w=is&k=20&c=utwrb5kR74kTACb1sOLHp3RaY3AtzKLgoYw1EIelC48=');
    return temp;
  }
}
