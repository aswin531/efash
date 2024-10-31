class Product {
  final int id;
  final String slug;
  final String code;
  final String homeImg;
  final String name;
  final dynamic isGender;
  final String store;
  final String manufacturer;
  final double oldPrice;
  final double price;
  final String image;
  final int cart;
  final int wishlist;

  Product({
    required this.id,
    required this.slug,
    required this.code,
    required this.homeImg,
    required this.name,
    required this.isGender,
    required this.store,
    required this.manufacturer,
    required this.oldPrice,
    required this.price,
    required this.image,
    required this.cart,
    required this.wishlist,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    double parsePrice(dynamic price) {
      if (price == null) return 0.0;
      if (price is double) return price;
      if (price is int) return price.toDouble();
      if (price is String) {
        try {
          return double.parse(price);
        } catch (e) {
          return 0.0;
        }
      }
      return 0.0;
    }

    return Product(
      id: json['id'] ?? 5,
      slug: json['slug'] ?? '',
      code: json['code'] ?? '',
      homeImg: json['home_img'] ?? '',
      name: json['name'] ?? '',
      isGender: json['is_gender'],
      store: json['store'] ?? '',
      manufacturer: json['manufacturer'] ?? '',
      oldPrice: parsePrice(json['oldprice']), // Changed this
      price: parsePrice(json['price']), // Changed this
      image: json['image'] ?? '',
      cart: json['cart'] ?? 0,
      wishlist: json['wishlist'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      //'id': id,
      'slug': slug,
      'code': code,
      //'home_img': homeImg,
      'name': name,
      //'is_gender': isGender,
      'store': store,
      'manufacturer': manufacturer,
      'oldprice': oldPrice.toString(),
      'price': price.toString(),
      'image': image,
      'cart': cart,
      'wishlist': wishlist,
    };
  }
}
