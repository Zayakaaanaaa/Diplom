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
      id: "1",
      barcode: 'asda ',
      catId: 5,
      img: 'assets/images/oil.png',
      name: '11111111111',
      price: [],
      productDetailTitle: 'fsdfw',
      productDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetail',
    ),
    id: '',
  ),
  ProductDetails(
    productDetail: ProductDetail(
      id: '1',
      barcode: 'asda ',
      catId: 5,
      img: 'assets/images/oil.png',
      name: '11111111111',
      price: [],
      productDetailTitle: 'fsdfw',
      productDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetail',
    ),
    id: '',
  ),
  ProductDetails(
    productDetail: ProductDetail(
      id: '1',
      barcode: 'asda ',
      catId: 5,
      img: 'assets/images/oil.png',
      name: '11111111111',
      price: [],
      productDetailTitle: 'fsdfw',
      productDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetail',
    ),
    id: '',
  ),
  ProductDetails(
    productDetail: ProductDetail(
      id: '1',
      barcode: 'asda ',
      catId: 5,
      img: 'assets/images/oil.png',
      name: '11111111111',
      price: [],
      productDetailTitle: 'fsdfw',
      productDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetail',
    ),
    id: '',
  ),
  ProductDetails(
    productDetail: ProductDetail(
      id: '1',
      barcode: 'asda ',
      catId: 5,
      img: 'assets/images/oil.png',
      name: '11111111111',
      price: [],
      productDetailTitle: 'fsdfw',
      productDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetail',
    ),
    id: '',
  ),
  ProductDetails(
    productDetail: ProductDetail(
      id: '1',
      barcode: 'asda ',
      catId: 5,
      img: 'assets/images/oil.png',
      name: '11111111111',
      price: [],
      productDetailTitle: 'fsdfw',
      productDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetail',
    ),
    id: '',
  ),
];

List<ProductDetail> newProducts = [
  ProductDetail(
    catId: 0,
    // id: 0,
    barcode: '123456789',
    img:
        'https://img.freepik.com/premium-vector/red-apple-with-green-leaves-transparent-background-vector-illustration-realistic-vector_545793-565.jpg?w=740',
    name: 'Алим',

    productDetailTitle: 'Тайлбар',
    productDetail:
        'Алим улаан кг А C витаминууд төмөр кальци эрдэс бодисоор баялаг',

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
    img:
        'https://cdn5.nomin.mn/media/catalog/product/cache/eeebe0eac0b4bc7ee54bf30f7830bf7a/5/f/5fe7f496527cc_mandarin.jpg',
    name: 'Мандарин Морокко кг',

    productDetailTitle: 'Тайлбар',
    productDetail:
        'Мандарин Морокко кг Е витамин аскорбины хүчил магни натри агуулдаг',

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
    img:
        'https://cdn5.nomin.mn/media/catalog/product/cache/eeebe0eac0b4bc7ee54bf30f7830bf7a/1/1/1138960.jpg',
    name: 'Мандарин ориг кг',

    productDetailTitle: 'Тайлбар ',
    productDetail:
        'Мандарин ориг кг Е витамин аскорбины хүчил магни натрийн агууламжтай',
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
    img:
        'https://cdn5.nomin.mn/media/catalog/product/cache/eeebe0eac0b4bc7ee54bf30f7830bf7a/i/m/image_34__11.png',
    name: 'Жүүс OKF Aloe',
    productDetailTitle: ' Тайлбар',
    productDetail: 'Жүүс OKF, Aloe vera original 1.5л',

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
    img:
        'https://cdn5.nomin.mn/media/catalog/product/cache/eeebe0eac0b4bc7ee54bf30f7830bf7a/6/0/6000200192698__20059.jpg',
    name: 'Ундаа SPV Coke',
    productDetailTitle: ' Тайлбар',
    productDetail: 'Ундаа SPV Coke 330 мл Хийжүүлсэн Үндсэн төрөл USA',

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
    img:
        'https://cdn5.nomin.mn/media/catalog/product/cache/eeebe0eac0b4bc7ee54bf30f7830bf7a/j/w/jwb_1l.jpg',
    name: 'Виски Int JOHNNIE',
    productDetailTitle: ' Тайлбар',
    productDetail: 'Виски JW BLACK LABEL 1л хар, 40% Шотланд',

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
    img:
        'https://cdn5.nomin.mn/media/catalog/product/cache/eeebe0eac0b4bc7ee54bf30f7830bf7a/f/i/file_8_482.jpg',
    name: 'Гахайн нурууны мах',

    productDetailTitle: ' Тайлбар',
    productDetail: 'Гахайн нурууны мах 400гр, утсан, Мах импекс',

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
    img:
        'https://cdn5.nomin.mn/media/catalog/product/cache/eeebe0eac0b4bc7ee54bf30f7830bf7a/s/e/selen.jpg',
    name: 'Өндөг баяжуулсан 15ш',
    productDetailTitle: ' Тайлбар',
    productDetail: 'Өндөг баяжуулсан 15ш Түмэн шувуут',

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
    img:
        'https://cdn5.nomin.mn/media/catalog/product/cache/eeebe0eac0b4bc7ee54bf30f7830bf7a/s/c/screenshot_2022-03-15_114515.png',
    name: 'Сүү Миний Монгол ',
    productDetailTitle: ' Тайлбар',
    productDetail:
        'Цэнхэр өнгийн савлагаатай, 3,2%-ийн тослогтой илчлэг сүү нь таны гэр бүлийн кальци болон Д аминдэмийн хэрэгцээг хангана.',

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
    img:
        'https://cdn5.nomin.mn/media/catalog/product/cache/eeebe0eac0b4bc7ee54bf30f7830bf7a/0/2/02701101.png',
    name: 'Шоколад Cofler 170гр',
    productDetailTitle: ' Тайлбар',
    productDetail: 'Шоколад, Cofler 170гр, самартай 024170',

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
    img:
        'https://cdn5.nomin.mn/media/catalog/product/cache/eeebe0eac0b4bc7ee54bf30f7830bf7a/s/c/screenshot_2023-02-11_141810.png',
    name: 'Гурил Алтан тариа 5кг',
    productDetailTitle: ' Тайлбар',
    productDetail:
        'Гурил Алтан тариа 5кг дээдийн дээд зэрэг аминдэм эрдэс бодисоор баялаг MNG',

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
    img:
        'https://cdn5.nomin.mn/media/catalog/product/cache/eeebe0eac0b4bc7ee54bf30f7830bf7a/_/5/_550_2.png',
    name: 'Салат Газар шим',

    productDetailTitle: ' Тайлбар',
    productDetail: 'Салат Өег 600мл 022299',

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
    img:
        'https://cdn5.nomin.mn/media/catalog/product/cache/eeebe0eac0b4bc7ee54bf30f7830bf7a/b/r/brazilhar.png',
    name: 'Кофе Brazil хар',

    productDetailTitle: ' Тайлбар',
    productDetail: 'Кофе, Brazil, хар, 50ш, 021939',

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
    img:
        'https://cdn5.nomin.mn/media/catalog/product/cache/eeebe0eac0b4bc7ee54bf30f7830bf7a/0/2/02004082_1.png',
    name: 'Талх Атар 600гр',

    productDetailTitle: ' Тайлбар',
    productDetail: "Талх, Атар, 600гр, чихэргүй, савласан, Талх чихэр 021639",

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
    img:
        'https://cdn5.nomin.mn/media/catalog/product/cache/eeebe0eac0b4bc7ee54bf30f7830bf7a/3/7/3750575302358412316_800_x_800-removebg-preview.png',
    name: 'Нарийн боов Цөцгийтэй 450гр',

    productDetailTitle: ' Тайлбар',
    productDetail: 'Нарийн боов цөцгийтэй 450гр Талх чихэр 021639',

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
        name: 'Мах махан бүтээгдэхүүн',
        catColor: const Color(0xffF7A593)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 1,
        img: 'assets/images/fruits.png',
        name: 'Жимс хүнсний ногоо',
        catColor: const Color(0xff53B175)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 2,
        img: 'assets/images/oil.png',
        name: 'Сүү сүүн бүтээгдэхүүн',
        catColor: const Color(0xffF8A44C)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 3,
        img: 'assets/images/petcare.png',
        name: 'Цай кофе',
        catColor: const Color(0xff8B91A0)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 4,
        img: 'assets/images/bread.png',
        name: 'Талх нарийн боов',
        catColor: const Color(0xffD3B0E0)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 5,
        img: 'assets/images/eggs.png',
        name: 'Даршилсан нөөшилсөн',
        catColor: const Color(0xffFDE598)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 6,
        img: 'assets/images/beverages.png',
        name: 'Шингэн бүтээгдэхүүн',
        catColor: const Color(0xffB7DFF5)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 7,
        img: 'assets/images/household.jpg',
        name: 'Амттан',
        catColor: const Color(0xff8B91A0)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 8,
        img: 'assets/images/petcare.png',
        name: 'Хоол амтлагч',
        catColor: const Color(0xff8B91A0)),
  ),
];

List<StoreDetail> storeList = [
  StoreDetail(
    address: 'gjernwmle,f;wopemf',
    storeId: 0,
    img: 'assets/stores/emart.jpg',
    phone: '12345678',
    name: 'Emart',
  ),
  StoreDetail(
    address: 'gjernwmle,f;wopemf',
    storeId: 0,
    img: 'assets/stores/carrefour.png',
    phone: '12345678',
    name: 'Carrefour',
  ),
  StoreDetail(
    address: 'gjernwmle,f;wopemf',
    storeId: 0,
    img: 'assets/stores/minii.png',
    phone: '12345678',
    name: 'Minii suljee',
  ),
  StoreDetail(
    address: 'gjernwmle,f;wopemf',
    storeId: 0,
    img: 'assets/stores/mmart.png',
    phone: '12345678',
    name: 'M mart',
  ),
  StoreDetail(
    address: 'gjernwmle,f;wopemf',
    storeId: 0,
    img: 'assets/stores/nomin.png',
    phone: '12345678',
    name: 'Nomin',
  ),
  StoreDetail(
    address: 'gjernwmle,f;wopemf',
    storeId: 0,
    img: 'assets/stores/sansar.jpg',
    phone: '12345678',
    name: 'Sansar',
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
    // for (int i = 0; i < listItems.length; i++) {
    //   temp.add(listItems[i]);
    // }
    temp.add(listItems[0]);
    return temp;
  }

  static List<ProductDetail> addProduct() {
    List<ProductDetail> temp = [];
    for (int i = 0; i < newProducts.length; i++) {
      temp.add(newProducts[i]);
    }
    return temp;
  }

  static List<StoreDetail> addStore() {
    List<StoreDetail> temp = [];
    for (int i = 0; i < storeList.length; i++) {
      temp.add(storeList[i]);
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

  static List<StoreDetail> getStoreDetail() {
    List<StoreDetail> temp = [];
    for (int i = 0; i < storeList.length; i++) {
      temp.add(storeList[i]);
    }
    return temp;
  }

  Future<List<ProductDetails>> getAllProducts() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
        await firestore.collection('productDetails').get();

    List<ProductDetails> temp = [];

    List<ProductDetail> products = querySnapshot.docs.map((doc) {
      return ProductDetail.fromDocumentSnapshot(doc);
    }).toList();

    for (var doc in querySnapshot.docs) {
      var element = ProductDetail.fromDocumentSnapshot(doc);
      temp.add(
        ProductDetails(
          productDetail: element,
          id: doc.id, // Using the document ID here
        ),
      );
    }

    return temp;
  }

  Future<List<StoreCard>> getStores() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    // Get the snapshot of the Firestore collection
    QuerySnapshot snapshot = await firestore.collection('stores').get();

    List<StoreCard> temp = [];

    List<StoreDetail> stores = snapshot.docs.map((doc) {
      return StoreDetail.fromDocumentSnapshotMap(doc);
    }).toList();

    for (var doc in snapshot.docs) {
      var element = StoreDetail.fromDocumentSnapshotMap(doc);
      temp.add(
        StoreCard(
          storeDetail: element,
          id: doc.id,
        ),
      );
    }
    // Convert each document into a StoreDetail object
    return temp;
  }

  Future<ProductDetail> getProductDetail1(String documentId) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('productDetails')
        .doc(documentId)
        .get();

    if (doc.exists) {
      return ProductDetail.fromDocumentSnapshot(doc);
    } else {
      throw Exception('Product not found');
    }
  }

  static PriceStores getCheapestPrice(List<PriceStores> prices) {
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
