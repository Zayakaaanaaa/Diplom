import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/model/cart_list.dart';
import 'package:grocery_store/model/product_detail.dart';
import 'package:grocery_store/model/profile/store_employee.dart';
import 'package:grocery_store/model/store/branch.dart';
import 'package:grocery_store/model/store/store.dart';
import 'package:grocery_store/util/user.dart';
import 'package:grocery_store/widgets/category_card.dart';
import 'package:grocery_store/widgets/product_card.dart';
import '../model/category.dart';
import '../model/profile/user.dart';
import '../model/store/review.dart';
import '../util/constants.dart';
import '../util/utils.dart';
import '../widgets/store/store_card.dart';
import '../widgets/store/store_product_card.dart';
import 'package:path/path.dart' as path;

List<ProductDetails> listItems = [
  ProductDetails(
    productDetail: ProductDetail(
      id: "1",
      barcode: 'asda ',
      catId: 5,
      img: 'assets/images/oil.png',
      name: '11111111111',
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
      productDetailTitle: 'fsdfw',
      productDetail:
          'productDetailproductDetailproductDetailproductDetailproductDetail',
    ),
    id: '',
  ),
];

List<ProductDetail> newProducts = [
  ProductDetail(
    catId: 1,
    // id: 0,
    barcode: '123456789',
    img:
        'https://img.freepik.com/premium-vector/red-apple-with-green-leaves-transparent-background-vector-illustration-realistic-vector_545793-565.jpg?w=740',
    name: 'Алим',

    productDetailTitle: 'Тайлбар',
    productDetail:
        'Алим улаан кг А C витаминууд төмөр кальци эрдэс бодисоор баялаг',
    nomin: 14500,
    sansar: 14000,
    mmart: 15000,
    msuljee: 14800,
    carrefour: 14900,
    emart: 15100,
  ),
  ProductDetail(
    catId: 0,
    // id: 0,
    barcode: '123456789',
    img:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.jiJcjK7p7N55GUP6MoVENQHaE6%26pid%3DApi&f=1&ipt=e2f79e20d9d87af45fb07e741d33774893974abfd1c4494fc10f885d063e989a&ipo=images',
    name: 'Тахианы мах',
    productDetailTitle: 'Тайлбар',
    productDetail:
        'Тахианы мах нь өндөр чанартай амин хүчил, өөх тос багатай, уургийн эрүүл эх үүсвэр юм',
    nomin: 16500,
    sansar: 16000,
    mmart: 17000,
    msuljee: 14800,
    carrefour: 13900,
    emart: 15100,
  ),
  ProductDetail(
    catId: 2,
    // id: 0,
    barcode: '123456789',
    img:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.K9u_jC9RjYFdg2i47O7gRgHaHa%26pid%3DApi&f=1&ipt=6e518a9986e3b245e0b152539b7defaff0b544dfb00135b844d614189db3ea14&ipo=images',
    name: 'Тараг',

    productDetailTitle: 'Тайлбар',
    productDetail:
        'Тарагны витамин, эрдэс бодисууд нь А аминдэм, витамин С, кальци агуулдаг.',
    nomin: 10500,
    sansar: 12000,
    mmart: 11000,
    msuljee: 12800,
    carrefour: 10900,
    emart: 12100,
  ),
  ProductDetail(
    catId: 7,
    // id: 0,
    barcode: '123456789',
    img:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.dQmbwkrHKA8pshmqyAsfGgHaE8%26pid%3DApi&f=1&ipt=8ba393153bfca555e6a999d1142116732939426bcfa19dbaa27c606bd3188476&ipo=images',

    productDetailTitle: 'Тайлбар',
    productDetail:
        'Хар шоколад нь эрдэс бодис, антиоксидант болон бусад нэгдлээр баялаг.',
    nomin: 7900,
    sansar: 8100,
    mmart: 7500,
    msuljee: 8750,
    carrefour: 7950,
    emart: 8750, name: 'Хар шоколад',
  ),
  ProductDetail(
    catId: 4,
    // id: 0,
    barcode: '123456789',
    img:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.GhIXmtTtbjhStMK1NftA8wHaDi%26pid%3DApi&f=1&ipt=5661bf21adfc051ab06b47c4d98894300702421ce5ee929e6c9d8aca8ce187c9&ipo=images',

    productDetailTitle: 'Тайлбар',
    productDetail:
        'Талх нь эслэг, уураг, пребиотик ашиг тус, микро элементүүдээрээ эрүүл хооллолтын нэг хэсэг юм.',
    sansar: 3500,
    mmart: 3800,
    msuljee: 2980,
    carrefour: 3700,
    emart: 4210, name: 'Талх',
  ),
  ProductDetail(
    catId: 6,
    // id: 0,
    barcode: '123456789',
    img:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.C6-z7gMv5-Vc9ZQWXkqAgwAAAA%26pid%3DApi&f=1&ipt=aae1da86b495c65fff22b3fa9e41d7cb570a7279e0b8479d0dc39e476f2ec01b&ipo=images',
    name: 'Цэвэр ус',

    productDetailTitle: 'Тайлбар',
    productDetail:
        'Цэвэр ус нь хүний ​​эрүүл мэнд, байгаль орчин, эдийн засагт чухал үүрэгтэй.',
    nomin: 14500,
    sansar: 14000,
    mmart: 15000,
    msuljee: 14800,
    carrefour: 14900,
    emart: 15100,
  ),
  ProductDetail(
    catId: 5,
    // id: 0,
    barcode: '123456789',
    img:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.qiKQUuOsjNukat2Qccsp7AHaNR%26pid%3DApi&f=1&ipt=6f5c552c851362bc7caaff800471347d2dfdfccbba16068c4493accefb6db6eb&ipo=images',
    name: 'Даршилсан өргөст хэмх',

    productDetailTitle: 'Тайлбар',
    productDetail:
        'Өргөст хэмхийн шүүс нь холестролыг бууруулдаг бөгөөд цусны даралтыг хянаж, диабиттай хүмүүст эерэг нөлөө үзүүлнэ.',
    nomin: 10300,
    sansar: 11000,
    mmart: 9980,
    msuljee: 10200,
    carrefour: 11700,
    emart: 10900,
  ),
  ProductDetail(
    catId: 3,
    // id: 0,
    barcode: '123456789',
    img:
        'https://www.office-planet.ru/goods/620015/234b2aaf1f8b4c6c13f8285af0f0e546_xl.jpg',
    name: 'Кофе',

    productDetailTitle: 'Тайлбар',
    productDetail: 'Кофе нь зүрх судасны өвчлөлд өртөх эрсдэлийг бууруулна',
    nomin: 10500,
    sansar: 11200,
    mmart: 10050,
    msuljee: 10200,
    carrefour: 11000,
    emart: 12300,
  ),
  ProductDetail(
    catId: 8,
    // id: 0,
    barcode: '123456789',
    img: 'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX4195846.jpg',
    name: 'Яншуй',

    productDetailTitle: 'Тайлбар',
    productDetail: 'Яншуй нь цусыг цэвэрлэдэг нарийн ногоо юм',
    nomin: 7800,
    sansar: 8200,
    mmart: 7560,
    msuljee: 7600,
    carrefour: 7560,
    emart: 8100,
  ),
  ProductDetail(
    catId: 0,
    // id: 0,
    barcode: '123456789',
    img:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.yfC9JCJefAlAqk_DTm-sbwHaE7%26pid%3DApi&f=1&ipt=bc687d7b728483ce6cc7186006690b01f41e7799255afbab7acc2420555e0bbc&ipo=images',
    name: 'Хиам',

    productDetailTitle: 'Тайлбар',
    productDetail:
        'Хиам нь эрүүл цусны улаан эс, гемоглобины үйлдвэрлэлд зайлшгүй шаардлагатай В-12 витамин, төмрийг их хэмжээгээр агуулдаг.',
    nomin: 8700,
    sansar: 8950,
    mmart: 7580,
    msuljee: 8210,
    carrefour: 9100,
    emart: 8750,
  ),
  ProductDetail(
    catId: 1,
    // id: 0,
    barcode: '123456789',
    img:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.6HqCPWBBpFyJCxR7xDCGmwHaIP%26pid%3DApi&f=1&ipt=2e937d943267efbfbef06aee9cb0c25fd43ee1a689e74dd079464341dbd2f96b&ipo=images',
    name: 'Усан үзэм',

    productDetailTitle: 'Тайлбар',
    productDetail:
        'Усан үзэм бол илчлэг багатай, тэжээллэг цитрус жимс бөгөөд эрүүл мэндэд тустай.',
    nomin: 13000,
    sansar: 13500,
    mmart: 12900,
    msuljee: 12800,
    carrefour: 12000,
    emart: 13750,
  ),
  ProductDetail(
    catId: 5,
    // id: 0,
    barcode: '123456789',
    img:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.vDCHBxODS9qYiEOUzUFYUgHaH-%26pid%3DApi&f=1&ipt=2e18db4e45a826f300cef5372725c10570409c623793de1b1209c8e9d9bdfed0&ipo=images',
    name: 'Лаазалсан мөөг',

    productDetailTitle: 'Тайлбар',
    productDetail:
        'Мөөг нь эслэг, ханаагүй тосны хүчлүүдийн сайн эх үүсвэр бөгөөд илчлэг багатай байдаг. ',
    nomin: 8900,
    sansar: 9200,
    mmart: 8560,
    msuljee: 7900,
    carrefour: 9000,
    emart: 9150,
  ),
  ProductDetail(
    catId: 7,
    // id: 0,
    barcode: '123456789',
    img:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.8Re2Y3_n73XuVYEjhgJ-QgHaKs%26pid%3DApi&f=1&ipt=745c78ba80afec60556e47c3cc09bc50dc949cb22dba59b7e72645b4b864db0b&ipo=images',
    name: 'Жигнэмэг',

    productDetailTitle: 'Тайлбар',
    productDetail: 'Жигнэмэг нь бүхэл үр тариа агуулдаг.',
    nomin: 7800,
    sansar: 8100,
    mmart: 7850,
    msuljee: 7900,
    carrefour: 8000,
    emart: 8050,
  ),
  ProductDetail(
    catId: 6,
    // id: 0,
    barcode: '123456789',
    img:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.pmC9hAW3AjSMONspUTcRiwHaHa%26pid%3DApi&f=1&ipt=2b47ad8152f3fefaa5173e19a1cabb900934d7c4a92901ffdf20139cefa5d276&ipo=images',
    name: 'Шар доктор',

    productDetailTitle: 'Тайлбар',
    productDetail:
        'Шар доктор чацарганы олон төрөлт бүтээгдэхүүний найрлаган дахь амин дэмийн эмчилгээний ач холбогдолтой.',
    nomin: 4800,
    sansar: 4950,
    mmart: 5100,
    msuljee: 4850,
    carrefour: 4670,
    emart: 5235,
  ),
];

List<CategoryCard> categoryItems = [
  CategoryCard(
    categoryList: CategoryList(
        catId: 0,
        img:
            'https://png2.cleanpng.com/sh/dc950eac3b4a7a833a77017de38f4dff/L0KzQYm3UsE1N6lnj5H0aYP2gLBuTgN1bZJwRd9uYYSwcrbshr1kdJp1RdN7dD31f8X7hf4udZZmjJ9sbHnzccP7k702aWk5Uas6N0LndLS9WL4zQGQ9Tag9M0G4QYm9U8k0QGQ2UKkELoDxd1==/kisspng-steak-meat-beef-clip-art-rotten-meat-cliparts-5a8499172ddc68.2838564315186393831879.png',
        name: 'Мах махан бүтээгдэхүүн',
        catColor: const Color(0xffF7A593)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 1,
        img:
            'https://banner2.cleanpng.com/20171127/bb8/forest-fruits-png-vector-clipart-image-5a1c2664daed30.3109846215117942768967.jpg',
        name: 'Жимс хүнсний ногоо',
        catColor: const Color(0xff53B175)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 2,
        img:
            'https://banner2.cleanpng.com/20171128/a14/bottle-of-milk-png-vector-clipart-image-5a1d323e752c23.1741350915118628464799.jpg',
        name: 'Сүү сүүн бүтээгдэхүүн',
        catColor: const Color(0xffF8A44C)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 3,
        img:
            'https://banner2.cleanpng.com/20180318/guw/kisspng-coffee-cup-tea-cafe-clip-art-brown-coffee-cliparts-5aaf349195b0d6.2437104415214316976131.jpg',
        name: 'Цай кофе',
        catColor: const Color(0xff8B91A0)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 4,
        img:
            'https://banner2.cleanpng.com/20171128/3d1/bretzel-transparent-png-clip-art-image-5a1d0611add221.720415901511851537712.jpg',
        name: 'Талх нарийн боов',
        catColor: const Color(0xffD3B0E0)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 5,
        img:
            'https://banner2.cleanpng.com/20180216/vwq/kisspng-pickling-giardiniera-vegetable-chinese-pickles-a-jar-of-pickles-5a86b3d2c44bc2.6693387215187772988041.jpg',
        name: 'Даршилсан нөөшилсөн',
        catColor: const Color(0xffFDE598)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 6,
        img:
            'https://banner2.cleanpng.com/20180712/fxx/kisspng-fizzy-drinks-world-of-coca-cola-sprite-fanta-gaseosa-5b47b9b9685272.1663402015314272574273.jpg',
        name: 'Шингэн бүтээгдэхүүн',
        catColor: const Color(0xffB7DFF5)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 7,
        img:
            'https://banner2.cleanpng.com/20171216/7be/chocolate-png-image-5a35e52b2a3ee5.302188161513481515173.jpg',
        name: 'Амттан',
        catColor: const Color(0xff8B91A0)),
  ),
  CategoryCard(
    categoryList: CategoryList(
        catId: 8,
        img:
            'https://banner2.cleanpng.com/20180323/guq/kisspng-spice-mix-herb-clip-art-jamon-5ab4dc2917b7c1.9525107015218022810972.jpg',
        name: 'Хоол амтлагч',
        catColor: const Color(0xff8B91A0)),
  ),
];

List<StoreDetail> storeList = [
  StoreDetail(
    storeId: 0,
    img: 'assets/stores/emart.jpg',
    phone: '76110101',
    name: 'И март',
    images: [
      'https://assets-global.website-files.com/5e7c61e7f7fc3cb3d261095f/61a9dbe1b498d8b39e71cd94_257759109_587582055803412_5002216721168047763_n.jpg',
      'https://assets-global.website-files.com/5e7c61e7f7fc3cb3d261095f/616cefbb1b9cef71f5a5d574_1080-.jpg',
      'https://assets-global.website-files.com/5e7c61e7f7fc3cb3d261095f/6189e1170abd4871981b5287_254955832_625828818775157_6235667185463737176_n.jpg'
    ],
    reviews: [
      Review(
        authorName: 'John Doe',
        content: 'Great selection of products and friendly staff!',
        rating: 5,
        date: DateTime.now(),
        likes: 100,
      ),
    ],
    brances: [
      Branch(
        name: 'И Март Хороолол',
        schedule: '9:00 - 22:00',
        location: 'WVF8+5V8, Ард Аюушийн өргөн чөлөө, Улаанбаатар 16091',
      ),
      Branch(
        name: 'И Март Хороолол',
        schedule: '9:00 - 22:00',
        location: 'WVF8+5V8, Ард Аюушийн өргөн чөлөө, Улаанбаатар 16091',
      ),
      Branch(
        name: 'И Март Хороолол',
        schedule: '9:00 - 22:00',
        location: 'WVF8+5V8, Ард Аюушийн өргөн чөлөө, Улаанбаатар 16091',
      ),
    ],
  ),
  StoreDetail(
    storeId: 0,
    img: 'assets/stores/carrefour.png',
    phone: '99157538',
    name: 'Carrefour',
    images: [
      'https://assets-global.website-files.com/5e7c61e7f7fc3cb3d261095f/61a9dbe1b498d8b39e71cd94_257759109_587582055803412_5002216721168047763_n.jpg',
      'https://assets-global.website-files.com/5e7c61e7f7fc3cb3d261095f/616cefbb1b9cef71f5a5d574_1080-.jpg',
      'https://assets-global.website-files.com/5e7c61e7f7fc3cb3d261095f/6189e1170abd4871981b5287_254955832_625828818775157_6235667185463737176_n.jpg'
    ],
    reviews: [
      Review(
        authorName: 'John Doe',
        content: 'Great selection of products and friendly staff!',
        rating: 5,
        date: DateTime.now(),
        likes: 100,
      ),
    ],
    brances: [
      Branch(
        name: 'Нарны гүүр салбар',
        schedule: '9:00 - 22:30',
        location: 'Narnii Guur, Narnii Khoroolol 2nd Khoroo, Улаанбаатар',
      ),
      Branch(
        name: 'Хасбаатар центр салбар',
        schedule: '9:00 - 22:00',
        location: 'Khasbaatar Street Bileg Center, Улаанбаатар 16062',
      ),
      Branch(
        name: 'Энх тайвны салбар',
        schedule: '9:00 - 22:00',
        location: 'WV8P+3G3 Энхтайвны өргөн чөлөө, Улаанбаатар 16050',
      ),
    ],
  ),
  StoreDetail(
    storeId: 0,
    img: 'assets/stores/minii.png',
    phone: '17869428',
    name: 'Миний сүлжээ',
    images: [
      'https://assets-global.website-files.com/5e7c61e7f7fc3cb3d261095f/61a9dbe1b498d8b39e71cd94_257759109_587582055803412_5002216721168047763_n.jpg',
      'https://assets-global.website-files.com/5e7c61e7f7fc3cb3d261095f/616cefbb1b9cef71f5a5d574_1080-.jpg',
      'https://assets-global.website-files.com/5e7c61e7f7fc3cb3d261095f/6189e1170abd4871981b5287_254955832_625828818775157_6235667185463737176_n.jpg'
    ],
    reviews: [
      Review(
        authorName: 'John Doe',
        content: 'Great selection of products and friendly staff!',
        rating: 5,
        date: DateTime.now(),
        likes: 100,
      ),
    ],
    brances: [
      Branch(
        name: 'Нарны гүүр салбар',
        schedule: '9:00 - 22:30',
        location: 'Narnii Guur, Narnii Khoroolol 2nd Khoroo, Улаанбаатар',
      ),
      Branch(
        name: 'Хасбаатар центр салбар',
        schedule: '9:00 - 22:00',
        location: 'Khasbaatar Street Bileg Center, Улаанбаатар 16062',
      ),
      Branch(
        name: 'Энх тайвны салбар',
        schedule: '9:00 - 22:00',
        location: 'WV8P+3G3 Энхтайвны өргөн чөлөө, Улаанбаатар 16050',
      ),
    ],
  ),
  StoreDetail(
    storeId: 0,
    img: 'assets/stores/mmart.png',
    phone: '88542752',
    name: 'М март',
    images: [
      'https://assets-global.website-files.com/5e7c61e7f7fc3cb3d261095f/61a9dbe1b498d8b39e71cd94_257759109_587582055803412_5002216721168047763_n.jpg',
      'https://assets-global.website-files.com/5e7c61e7f7fc3cb3d261095f/616cefbb1b9cef71f5a5d574_1080-.jpg',
      'https://assets-global.website-files.com/5e7c61e7f7fc3cb3d261095f/6189e1170abd4871981b5287_254955832_625828818775157_6235667185463737176_n.jpg'
    ],
    reviews: [
      Review(
        authorName: 'John Doe',
        content: 'Great selection of products and friendly staff!',
        rating: 5,
        date: DateTime.now(),
        likes: 100,
      ),
    ],
    brances: [
      Branch(
        name: 'Нарны гүүр салбар',
        schedule: '9:00 - 22:30',
        location: 'Narnii Guur, Narnii Khoroolol 2nd Khoroo, Улаанбаатар',
      ),
      Branch(
        name: 'Хасбаатар центр салбар',
        schedule: '9:00 - 22:00',
        location: 'Khasbaatar Street Bileg Center, Улаанбаатар 16062',
      ),
      Branch(
        name: 'Энх тайвны салбар',
        schedule: '9:00 - 22:00',
        location: 'WV8P+3G3 Энхтайвны өргөн чөлөө, Улаанбаатар 16050',
      ),
    ],
  ),
  StoreDetail(
    storeId: 0,
    img: '/stores/nomin.png',
    phone: '74859632',
    name: 'Номин',
    images: [
      'https://assets-global.website-files.com/5e7c61e7f7fc3cb3d261095f/61a9dbe1b498d8b39e71cd94_257759109_587582055803412_5002216721168047763_n.jpg',
      'https://assets-global.website-files.com/5e7c61e7f7fc3cb3d261095f/616cefbb1b9cef71f5a5d574_1080-.jpg',
      'https://assets-global.website-files.com/5e7c61e7f7fc3cb3d261095f/6189e1170abd4871981b5287_254955832_625828818775157_6235667185463737176_n.jpg'
    ],
    reviews: [
      Review(
        authorName: 'John Doe',
        content: 'Great selection of products and friendly staff!',
        rating: 5,
        date: DateTime.now(),
        likes: 100,
      ),
    ],
    brances: [
      Branch(
        name: 'Нарны гүүр салбар',
        schedule: '9:00 - 22:30',
        location: 'Narnii Guur, Narnii Khoroolol 2nd Khoroo, Улаанбаатар',
      ),
      Branch(
        name: 'Хасбаатар центр салбар',
        schedule: '9:00 - 22:00',
        location: 'Khasbaatar Street Bileg Center, Улаанбаатар 16062',
      ),
      Branch(
        name: 'Энх тайвны салбар',
        schedule: '9:00 - 22:00',
        location: 'WV8P+3G3 Энхтайвны өргөн чөлөө, Улаанбаатар 16050',
      ),
    ],
  ),
  StoreDetail(
    storeId: 0,
    img: '/stores/sansar.png',
    phone: '12345678',
    name: 'Сансар',
    images: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL8aFL625Go4Lt27o-ChoBef_xFQIpXzl7-7cOjmFSW3VDW8KIeh0RnXwEUEiTALv-nmg&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJjMHTjPjZwrS1Md6jnRqSvCCtr1SVmP8wWRDL7BS2KDW4uVKpq9ed9O4VMoEgnBfaIeU&usqp=CAU',
      'https://content.ikon.mn/news/2018/4/10/97bf1c_01_x974.jpg',
    ],
    reviews: [
      Review(
        authorName: 'John Doe',
        content: 'Great selection of products and friendly staff!',
        rating: 5,
        date: DateTime.now(),
        likes: 100,
      ),
    ],
    brances: [
      Branch(
          name: 'Арвайн үндэс салбар',
          schedule: '9:00 - 22:00',
          location:
              'СХД, 4-р хороо, Их наранд байрлах Арвайн Үндэс ХХК байранд, Ulaanbaatar'),
      Branch(
          name: 'Олимп хотхон салбар',
          schedule: '9:00 - 22:00',
          location: 'БЗД, 26-р хороо, олимт хотхон'),
      Branch(
          name: 'Сансар туннел салбар',
          schedule: '9:00 - 22:00',
          location: 'БЗД, 3-р хороо, Сансарын үйлчилгээний төв'),
      Branch(
          name: '32-ийн тойрог салбар',
          schedule: '9:00 - 22:00',
          location: 'СБД, 23-р хороо, 32-ийн тойрог'),
    ],
  ),
];

class GroceryModel {
  String? userId = UserPreferences.getUser();

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

  List<String> getCategoryNames() {
    List<String> temp = [];
    for (int i = 0; i < categoryItems.length; i++) {
      temp.add(categoryItems[i].categoryList.name);
    }
    return temp;
  }

  // static List<CartItem> getCartItems() {
  //   List<CartItem> temp = [];
  //   for (int i = 0; i < cartItems.length; i++) {
  //     temp.add(cartItems[i]);
  //   }
  //   return temp;
  // }

  // static List<FavoriteItem> getFavoriteItems() {
  //   List<FavoriteItem> temp = [];
  //   for (int i = 0; i < favoriteItems.length; i++) {
  //     temp.add(favoriteItems[i]);
  //   }
  //   return temp;
  // }

  // Future<List<ProductDetail>> searchProduct(String name) async {
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //       .collection('productDetails')
  //       .where('name', isEqualTo: name)
  //       .get();

  //   List<ProductDetail> searchResults = querySnapshot.docs
  //       .map((doc) => ProductDetail.fromDocumentSnapshot(doc))
  //       .toList();
  //   print(name);
  //   // Print each search result for debugging purposes
  //   for (var product in searchResults) {
  //     print('Product found: ${product.name}, ID: ${product.id}');
  //   }

  //   return searchResults;
  // }

  Stream<List<StoreEmployee>> getEmployees() {
    return firestore.collection('storeEmployee').snapshots().map((snapshot) =>
        snapshot.docs
            .map((doc) => StoreEmployee.fromDocumentSnapshot(doc))
            .toList());
  }

  Future<List<ProductDetail>> searchProduct(String name) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('productDetails')
        .where('name', isEqualTo: name)
        .get();

    return querySnapshot.docs
        .map((doc) => ProductDetail.fromDocumentSnapshot(doc))
        .toList();
  }

  Future<List<ProductDetails>> getAllProducts() async {
    QuerySnapshot querySnapshot =
        await firestore.collection('productDetails').get();

    List<ProductDetails> temp = [];
    for (var doc in querySnapshot.docs) {
      var element = ProductDetail.fromDocumentSnapshot(doc);
      temp.add(
        ProductDetails(
          productDetail: element,
          id: doc.id,
        ),
      );
    }

    return temp;
  }

  Future<List<StoreProductCard>> getStoreProducts(String store) async {
    const storeFieldMap = {
      'Миний сүлжээ': 'msuljee',
      'И март': 'emart',
      'М март': 'mmart',
      'Номин': 'nomin',
      'Сансар': 'sansar',
      'Carrefour': 'carrefour',
    };

    final String fieldName = storeFieldMap[store] ?? store;

    QuerySnapshot querySnapshot = await firestore
        .collection('productDetails')
        .where(fieldName, isGreaterThan: 0) // Change this condition as needed
        .get();

    List<StoreProductCard> temp = [];
    for (var doc in querySnapshot.docs) {
      var element = ProductDetail.fromDocumentSnapshot(doc);
      temp.add(
        StoreProductCard(
          productDetail: element,
          id: doc.id,
          storeName: store,
        ),
      );
    }

    return temp;
  }

  Future<List<ProductDetails>> getCategoryProducts(String docId) async {
    QuerySnapshot querySnapshot = await firestore
        .collection('category')
        .doc(docId)
        .collection('products')
        .get();

    List<ProductDetails> temp = [];

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

  Future<List<StoreCard>> getStores(bool phone) async {
    QuerySnapshot snapshot = await firestore.collection('stores').get();

    List<StoreCard> temp = [];

    for (var doc in snapshot.docs) {
      var element = StoreDetail.fromDocumentSnapshotMap(doc);
      temp.add(
        StoreCard(
          storeDetail: element,
          id: doc.id,
          phone: phone,
        ),
      );
    }
    return temp;
  }

  Future<ProductDetails> getBarcodeProduct(String barcode) async {
    QuerySnapshot snapshot = await firestore
        .collection('productDetails')
        .where('barcode', isEqualTo: barcode)
        .get();

    if (snapshot.docs.isEmpty) {
      throw Exception('Product not found!');
    }

    var doc = snapshot.docs.first;

    ProductDetail productDetail = ProductDetail.fromDocumentSnapshot(doc);

    return ProductDetails(
      productDetail: productDetail,
      id: doc.id,
    );
  }

  Future<void> uploadImageToFirebaseStorage(
      File image, String docId, BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    try {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('productDetails/$docId/${path.basename(image.path)}');

      await ref.putFile(image);

      String downloadURL = await ref.getDownloadURL();

      await firestore.collection('productDetails').doc(docId).update({
        'photoURL': downloadURL,
      });

      Navigator.pop(context);
    } catch (e) {
      Navigator.pop(context);
      print(e); // Handle error

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to upload image: ${e.toString()}")),
      );
    }
  }

  Future<List<CartProduct>> getCartProducts(String userID) async {
    List<CartProduct> temp = [];

    try {
      CollectionReference subcollectionRef = FirebaseFirestore.instance
          .collection('cartProducts')
          .doc(userID)
          .collection('product');

      QuerySnapshot subcollectionSnapshot = await subcollectionRef.get();

      subcollectionSnapshot.docs.forEach(
        (doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

          CartProduct product = CartProduct(
            prodcutDocId: doc.id,
            product: data['product'],
            quantity: data['quantity'],
          );
          temp.add(product);
        },
      );
    } catch (e) {
      print('Error getting subcollection document data: $e');
    }
    print(temp);
    return temp;
  }

  Future<double> getCartPrice(String userID, String store) async {
    double totalPrice = 0;

    try {
      CollectionReference cartRef = FirebaseFirestore.instance
          .collection('cartProducts')
          .doc(userID)
          .collection('product');

      QuerySnapshot cartSnapshot = await cartRef.get();

      List<Future<double>> productPrices = cartSnapshot.docs.map((doc) async {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        CartProduct cartProduct = CartProduct(
          prodcutDocId: doc.id,
          product: data['product'],
          quantity: data['quantity'],
        );

        try {
          ProductDetail productDetail =
              await getProductDetail1(cartProduct.product);
          double price = 0.0; // Default price
          switch (store) {
            case 'Сансар':
              price = productDetail.sansar ?? 0.0;
              break;
            case 'И март':
              price = productDetail.emart ?? 0.0;
              break;
            case 'Carrefour':
              price = productDetail.carrefour ?? 0.0;
              break;
            case 'Миний сүлжээ':
              price = productDetail.msuljee ?? 0.0;
              break;
            case 'М март':
              price = productDetail.mmart ?? 0.0;
              break;
            case 'Номин':
              price = productDetail.nomin ?? 0.0;
              break;
            default:
              print('Store not recognized: $store');
              break;
          }
          return price * cartProduct.quantity;
        } catch (e) {
          return 0.0;
        }
      }).toList();

      List<double> prices = await Future.wait(productPrices);
      totalPrice = prices.fold(0, (a, b) => a + b);
    } catch (e) {
      print('Error getting cart price: $e');
    }
    return totalPrice;
  }

  Future<List<CartProduct>> getFavoriteProducts(String? userID) async {
    List<CartProduct> temp = [];

    print('object');
    try {
      CollectionReference subcollectionRef = FirebaseFirestore.instance
          .collection('favoriteProducts')
          .doc(userID)
          .collection('product');

      QuerySnapshot subcollectionSnapshot = await subcollectionRef.get();

      subcollectionSnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        CartProduct product = CartProduct(
          prodcutDocId: doc.id,
          product: data['product'],
          quantity: data['quantity'],
        );
        temp.add(product);
      });
    } catch (e) {
      print('Error getting subcollection document data: $e');
    }
    return temp;
  }

  Future<List<String>> getStoresNames() async {
    List<String> storeNames = [];

    try {
      // Get the collection from Firestore
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('stores').get();

      // Iterate through the documents and add the 'name' to the list
      for (var document in querySnapshot.docs) {
        var data = document.data();
        if (data is Map<String, dynamic>) {
          String name = data['name'];
          if (name != null) {
            storeNames.add(name);
          }
        }
      }
    } catch (e) {
      // Handle any errors here
      print(e.toString());
    }

    return storeNames;
  }

  Future<void> updateCartItemQuantity(
    String? userId,
    String cartItemId,
    int newQuantity,
  ) async {
    try {
      if (userId != null) {
        print('User ID is empty.');
        await FirebaseFirestore.instance
            .collection('cartProducts')
            .doc(userId)
            .collection('product')
            .doc(cartItemId)
            .update(
          {'quantity': newQuantity},
        );
      }
    } catch (e) {
      print(e);
    }
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

  Future<void> addProductToCart(
      String userID, String productID, int quantity) async {
    CollectionReference productsCollection =
        firestore.collection('cartProducts').doc(userID).collection('product');

    QuerySnapshot existingProducts =
        await productsCollection.where('product', isEqualTo: productID).get();

    if (existingProducts.docs.isEmpty) {
      await productsCollection.add({
        'quantity': quantity,
        'product': productID,
      });
    } else {
      Utils.showSnackBar('Бүтээгдэхүүн сагсанд нэмэгдсэн байна.');
    }
  }

  Future<bool> isFavorite(String? userID, String productId) async {
    if (userID == null) {
      return false;
    }

    var userFavoritesRef = firestore
        .collection('favoriteProducts')
        .doc(userID)
        .collection('product');

    var querySnapshot =
        await userFavoritesRef.where('product', isEqualTo: productId).get();

    return querySnapshot.docs.isNotEmpty;
  }

  Future<void> addOrRemoveFavorite(
    String? userID,
    String productId,
    BuildContext context,
    int _quantity,
  ) async {
    var userFavoritesRef = firestore
        .collection('favoriteProducts')
        .doc(userID)
        .collection('product');

    var querySnapshot =
        await userFavoritesRef.where('product', isEqualTo: productId).get();

    if (querySnapshot.docs.isEmpty) {
      await userFavoritesRef.add(
        {
          'product': productId,
          'quantity': _quantity,
        },
      );
      Utils.showSnackBar('Дуртай бүтээгдэхүүний жагсаалтад нэмлээ.');
    } else {
      await userFavoritesRef.doc(querySnapshot.docs.first.id).delete();
      Utils.showSnackBar(
          'Бүтээгдэхүүнийг дуртай бүтээгдэхүүний жагсаалтаас хаслаа жагсаалтаас хаслаа.');
    }
  }

  Future<void> removeFavorite(String itemId) async {
    try {
      await FirebaseFirestore.instance
          .collection('favoriteProducts')
          .doc(userId)
          .collection('product')
          .doc(itemId)
          .delete();

      print('Item deleted successfully');
    } catch (e) {
      print('Error deleting item: $e');
    }
  }

  Future<void> deleteItem(String itemId) async {
    try {
      await FirebaseFirestore.instance
          .collection('cartProducts')
          .doc(userId)
          .collection('product')
          .doc(itemId)
          .delete();

      Utils.showSnackBar('Бүтээгдэхүүнийг жагсаалтаас хаслаа.');
    } catch (e) {
      print('Error deleting item: $e');
    }
  }

  Future<StoreEmployee> getEmployeeData(String userId) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('storeEmployee')
        .doc(userId)
        .get();

    if (doc.exists) {
      return StoreEmployee.fromDocumentSnapshot(doc);
    } else {
      throw Exception('User not found');
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
      await firestore.collection('products').add(product.toMap());
    }
  }

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
