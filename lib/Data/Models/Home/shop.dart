import 'dart:convert';

//Shoping shopimgFromJson(String str) => Shoping.fromJson(json.decode(str));

//String shopimgToJson(Shoping data) => json.encode(data.toJson());

class Shoping {
  bool? status;
  dynamic message;
  Data? data;

  Shoping.fromJson(Map<String, dynamic> json) {
    this.status = json["status"];
    this.message = json["message"];
    this.data = Data.fromJson(json["data"]);
  }

// Map<String, dynamic> toJson() => {
//   "status": status,
//   "message": message,
//   "data": data!.toJson(),
// };
}

class Data {
  List<Banner>? banners;
  List<Product>? products;
  String? ad;

  Data.fromJson(Map<String, dynamic> json) {
    this.banners =
        List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x)));
    this.products =
        List<Product>.from(json["products"].map((x) => Product.fromJson(x)));
    this.ad = json["ad"];
  }

// Map<String, dynamic> toJson() => {
//   "banners": List<dynamic>.from(banners!.map((x) => x.toJson())),
//   "products": List<dynamic>.from(products!.map((x) => x.toJson())),
//   "ad": ad,
// };
}

class Banner {
  int? id;
  String? image;
  dynamic category;
  dynamic product;

  Banner.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.image = json["image"];
    this.category = json["category"];
    this.product = json["product"];
  }

// Map<String, dynamic> toJson() => {
//   "id": id,
//   "image": image,
//   "category": category,
//   "product": product,
// };
}

class Product {
  int? id;
  double? price;
  double? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  Product.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.price = json["price"].toDouble();
    this.oldPrice = json["old_price"].toDouble();
    this.discount = json["discount"];
    this.image = json["image"];
    this.name = json["name"];
    this.description = json["description"];
    this.images = List<String>.from(json["images"].map((x) => x));
    this.inFavorites = json["in_favorites"];
    this.inCart = json["in_cart"];
  }

// Map<String, dynamic> toJson() => {
//   "id": id,
//   "price": price,
//   "old_price": oldPrice,
//   "discount": discount,
//   "image": image,
//   "name": name,
//   "description": description,
//   "images": List<dynamic>.from(images!.map((x) => x)),
//   "in_favorites": inFavorites,
//   "in_cart": inCart,
// };
}
