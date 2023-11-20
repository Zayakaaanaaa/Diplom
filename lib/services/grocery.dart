import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grocery_store/model/cart_list.dart';
import 'package:grocery_store/model/product_detail.dart';
import 'package:grocery_store/model/store.dart';
import 'package:grocery_store/model/store_sector.dart';
import 'package:grocery_store/widgets/category_card.dart';
import 'package:grocery_store/widgets/product_card.dart';
import '../model/category.dart';
import '../model/store_price.dart';
import '../model/user.dart';
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
      price: [],
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
      price: [],
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
      price: [],
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
      price: [],
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
      price: [],
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
      price: [],
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

List<ProductDetail> newProducts = [
  ProductDetail(
    catId: 0,
    // id: 0,
    barcode: '123456789',
    img: 'path/to/image',
    name: 'Apple',
    size: '1kg',
    productDetailTitle: 'Milk ',
    productDetail: 'Detailed description of the product',
    nutritionDetail: 'Nutritional information',
    nutritionTitle: 'Nutrition Title',
    price: [
      PriceStores(storeId: 1, price: 1.99),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 3, price: 2.00),
      PriceStores(storeId: 4, price: 2.50),
      PriceStores(storeId: 5, price: 2.10),
      PriceStores(storeId: 6, price: 1.70),
    ],
  ),
  ProductDetail(
    catId: 0,
    // id: 0,
    barcode: '123456789',
    img: 'path/to/image',
    name: 'Apple',
    size: '1kg',
    productDetailTitle: 'Sugar ',
    productDetail: 'Detailed description of the product',
    nutritionDetail: 'Nutritional information',
    nutritionTitle: 'Nutrition Title',
    price: [
      PriceStores(storeId: 1, price: 1.99),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 3, price: 3.00),
      PriceStores(storeId: 4, price: 4.50),
      PriceStores(storeId: 5, price: 5.10),
      PriceStores(storeId: 6, price: 6.70),
    ],
  ),
  ProductDetail(
    catId: 0,
    // id: 0,
    barcode: '123456789',
    img: 'path/to/image',
    name: 'Apple',
    size: '1kg',
    productDetailTitle: 'Chips ',
    productDetail: 'Detailed description of the product',
    nutritionDetail: 'Nutritional information',
    nutritionTitle: 'Nutrition Title',
    price: [
      PriceStores(storeId: 1, price: 4.99),
      PriceStores(storeId: 2, price: 4.09),
      PriceStores(storeId: 3, price: 6.09),
      PriceStores(storeId: 4, price: 1.09),
      PriceStores(storeId: 5, price: 8.09),
      PriceStores(storeId: 6, price: 9.09),
    ],
  ),
  ProductDetail(
    catId: 1,
    // id: 0,
    barcode: '123456789',
    img: 'path/to/image',
    name: 'Apple',
    size: '1kg',
    productDetailTitle: 'Fanta ',
    productDetail: 'Detailed description of the product',
    nutritionDetail: 'Nutritional information',
    nutritionTitle: 'Nutrition Title',
    price: [
      PriceStores(storeId: 1, price: 4.99),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 3, price: 2.09),
      PriceStores(storeId: 4, price: 1.09),
      PriceStores(storeId: 5, price: 42.09),
      PriceStores(storeId: 6, price: 28.09),
    ],
  ),
  ProductDetail(
    catId: 1,
    // id: 0,
    barcode: '123456789',
    img: 'path/to/image',
    name: 'Apple',
    size: '1kg',
    productDetailTitle: 'Phone ',
    productDetail: 'Detailed description of the product',
    nutritionDetail: 'Nutritional information',
    nutritionTitle: 'Nutrition Title',
    price: [
      PriceStores(storeId: 1, price: 1.99),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 3, price: 3.00),
      // PriceStores(storeId: 4, price: 2.50),
      PriceStores(storeId: 5, price: 2.70),
      PriceStores(storeId: 6, price: 4.30),
    ],
  ),
  ProductDetail(
    catId: 2,
    // id: 0,
    barcode: '123456789',
    img: 'path/to/image',
    name: 'Apple',
    size: '1kg',
    productDetailTitle: 'Milk ',
    productDetail: 'Detailed description of the product',
    nutritionDetail: 'Nutritional information',
    nutritionTitle: 'Nutrition Title',
    price: [
      PriceStores(storeId: 1, price: 1.99),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 3, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
    ],
  ),
  ProductDetail(
    catId: 2,
    // id: 0,
    barcode: '123456789',
    img: 'path/to/image',
    name: 'Apple',
    size: '1kg',
    productDetailTitle: 'Milk3 ',
    productDetail: 'Detailed description of the product',
    nutritionDetail: 'Nutritional information',
    nutritionTitle: 'Nutrition Title',
    price: [
      PriceStores(storeId: 1, price: 1.99),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
    ],
  ),
  ProductDetail(
    catId: 3,
    // id: 0,
    barcode: '123456789',
    img: 'path/to/image',
    name: 'Apple',
    size: '1kg',
    productDetailTitle: 'orange ',
    productDetail: 'Detailed description of the product',
    nutritionDetail: 'Nutritional information',
    nutritionTitle: 'Nutrition Title',
    price: [
      PriceStores(storeId: 1, price: 1.99),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
    ],
  ),
  ProductDetail(
    catId: 4,
    // id: 0,
    barcode: '123456789',
    img: 'path/to/image',
    name: 'Apple',
    size: '1kg',
    productDetailTitle: 'apple ',
    productDetail: 'Detailed description of the product',
    nutritionDetail: 'Nutritional information',
    nutritionTitle: 'Nutrition Title',
    price: [
      PriceStores(storeId: 1, price: 1.99),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
    ],
  ),
  ProductDetail(
    catId: 4,
    // id: 0,
    barcode: '123456789',
    img: 'path/to/image',
    name: 'Apple',
    size: '1kg',
    productDetailTitle: 'Ice cream ',
    productDetail: 'Detailed description of the product',
    nutritionDetail: 'Nutritional information',
    nutritionTitle: 'Nutrition Title',
    price: [
      PriceStores(storeId: 1, price: 1.99),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
    ],
  ),
  ProductDetail(
    catId: 4,
    // id: 0,
    barcode: '123456789',
    img: 'path/to/image',
    name: 'Apple',
    size: '1kg',
    productDetailTitle: 'Potato ',
    productDetail: 'Detailed description of the product',
    nutritionDetail: 'Nutritional information',
    nutritionTitle: 'Nutrition Title',
    price: [
      PriceStores(storeId: 1, price: 1.99),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
    ],
  ),
  ProductDetail(
    catId: 4,
    // id: 0,
    barcode: '123456789',
    img: 'path/to/image',
    name: 'Apple',
    size: '1kg',
    productDetailTitle: 'Tomato ',
    productDetail: 'Detailed description of the product',
    nutritionDetail: 'Nutritional information',
    nutritionTitle: 'Nutrition Title',
    price: [
      PriceStores(storeId: 1, price: 1.99),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
    ],
  ),
  ProductDetail(
    catId: 4,
    // id: 0,
    barcode: '123456789',
    img: 'path/to/image',
    name: 'Apple',
    size: '1kg',
    productDetailTitle: 'Candy ',
    productDetail: 'Detailed description of the product',
    nutritionDetail: 'Nutritional information',
    nutritionTitle: 'Nutrition Title',
    price: [
      PriceStores(storeId: 1, price: 1.99),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
    ],
  ),
  ProductDetail(
    catId: 5,
    // id: 0,
    barcode: '123456789',
    img: 'path/to/image',
    name: 'Apple',
    size: '1kg',
    productDetailTitle: 'Beeer ',
    productDetail: 'Detailed description of the product',
    nutritionDetail: 'Nutritional information',
    nutritionTitle: 'Nutrition Title',
    price: [
      PriceStores(storeId: 1, price: 1.99),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
    ],
  ),
  ProductDetail(
    catId: 5,
    // id: 0,
    barcode: '123456789',
    img: 'path/to/image',
    name: 'Apple',
    size: '1kg',
    productDetailTitle: 'Meat ',
    productDetail: 'Detailed description of the product',
    nutritionDetail: 'Nutritional information',
    nutritionTitle: 'Nutrition Title',
    price: [
      PriceStores(storeId: 1, price: 1.99),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
      PriceStores(storeId: 2, price: 2.09),
    ],
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
        sectors: [
          StoreSector(
              sectorId: 0,
              sectorLng: LatLng(47.87190394101417, 106.83035418021754),
              sectorName: 'asdadw')
        ],
        price: 5.98),
  ),
  StoreCard(
    storeCards: StoreDetail(
        address: 'gjernwmle,f;wopemf',
        storeId: 0,
        img: 'assets/stores/carrefour.png',
        phone: '12345678',
        sectors: [
          StoreSector(
              sectorId: 0,
              sectorLng: LatLng(47.87190394101417, 106.83035418021754),
              sectorName: 'asdadw'),
          StoreSector(
              sectorId: 0,
              sectorLng: LatLng(47.878049862258365, 106.90971141206951),
              sectorName: 'asdadw'),
          StoreSector(
              sectorId: 0,
              sectorLng: LatLng(47.90774587454703, 106.87870769359223),
              sectorName: 'asdadw'),
          StoreSector(
              sectorId: 0,
              sectorLng: LatLng(47.93446787053064, 106.81835716669585),
              sectorName: 'asdadw'),
          StoreSector(
              sectorId: 0,
              sectorLng: LatLng(47.92325599188884, 106.94358201217408),
              sectorName: 'asdadw'),
          StoreSector(
              sectorId: 0,
              sectorLng: LatLng(47.93845088229213, 106.93620142360592),
              sectorName: 'asdadw'),
          StoreSector(
              sectorId: 0,
              sectorLng: LatLng(47.937197349038755, 106.91374796000875),
              sectorName: 'asdadw'),
          StoreSector(
              sectorId: 0,
              sectorLng: LatLng(47.92466034490062, 106.91842576492482),
              sectorName: 'asdadw'),
        ],
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
        sectors: [
          StoreSector(
              sectorId: 0,
              sectorLng: LatLng(47.87190394101417, 106.83035418021754),
              sectorName: 'asdadw')
        ],
        price: 6.5),
  ),
  StoreCard(
    storeCards: StoreDetail(
        address: 'gjernwmle,f;wopemf',
        storeId: 0,
        img: 'assets/stores/mmart.png',
        phone: '12345678',
        name: 'M mart',
        sectors: [
          StoreSector(
              sectorId: 0,
              sectorLng: LatLng(47.87190394101417, 106.83035418021754),
              sectorName: 'asdadw')
        ],
        price: 5.74),
  ),
  StoreCard(
    storeCards: StoreDetail(
        address: 'gjernwmle,f;wopemf',
        storeId: 0,
        img: 'assets/stores/nomin.png',
        phone: '12345678',
        name: 'Nomin',
        sectors: [
          StoreSector(
              sectorId: 0,
              sectorLng: LatLng(47.87190394101417, 106.83035418021754),
              sectorName: 'asdadw')
        ],
        price: 7.1),
  ),
  StoreCard(
    storeCards: StoreDetail(
        address: 'gjernwmle,f;wopemf',
        storeId: 0,
        img: 'assets/stores/sansar.jpg',
        phone: '12345678',
        name: 'Sansar',
        sectors: [
          StoreSector(
              sectorId: 0,
              sectorLng: LatLng(47.87190394101417, 106.83035418021754),
              sectorName: 'asdadw')
        ],
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

  static List<ProductDetail> addProduct() {
    List<ProductDetail> temp = [];
    for (int i = 0; i < newProducts.length; i++) {
      temp.add(newProducts[i]);
    }
    return temp;
  }

  static List<StoreSector> getStoreSector(int id) {
    List<StoreSector> temp = [];
    for (int i = 0; i < storeList[id].storeCards.sectors.length; i++) {
      temp.add(storeList[id].storeCards.sectors[i]);
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

  Future<List<ProductDetails>> getAllProducts() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore.collection('products').get();

    List<ProductDetails> temp = [];

    List<ProductDetail> products = querySnapshot.docs.map((doc) {
      return ProductDetail.fromDocumentSnapshot(doc);
    }).toList();

    for (var element in products) {
      temp.add(
        ProductDetails(productDetail: element),
      );
    }

    return temp;
  }

  Future<ProductDetail> getProductDetail1(String documentId) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('products')
        .doc(documentId)
        .get();

    if (doc.exists) {
      return ProductDetail.fromDocumentSnapshot(doc);
    } else {
      throw Exception('Product not found');
    }
  }

  Future<UserModel> getUserData(String userId) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (doc.exists) {
      return UserModel.fromDocumentSnapshot(doc);
    } else {
      throw Exception('User not found');
    }
  }

  Future<void> addProductsToFirestore(List<ProductDetail> products) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    for (var product in products) {
      // Let Firestore generate a unique ID
      await firestore.collection('products').add(product.toMap());
    }
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
