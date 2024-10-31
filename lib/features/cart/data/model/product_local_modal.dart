class ProductLocal {
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

  ProductLocal({
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

  factory ProductLocal.fromJson(Map<String, dynamic> json) {
    return ProductLocal(
      id: json['id'] ?? 0, 
      slug: json['slug'] ?? '',
      code: json['code'] ?? '',
      homeImg: json['homeImg'] ?? '',
      name: json['name'] ?? '',
      isGender: json['isGender'],
      store: json['store'] ?? '',
      manufacturer: json['manufacturer'] ?? '',
      oldPrice: json['oldPrice'] ?? 0.0,
      price: json['price'] ?? 0.0,
      image: json['image'] ?? '',
      cart: json['cart'] ?? 0,
      wishlist: json['wishlist'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'code': code,
      'homeImg': homeImg,
      'name': name,
      'isGender': isGender,
      'store': store,
      'manufacturer': manufacturer,
      'oldPrice': oldPrice,
      'price': price,
      'image': image,
      'cart': cart,
      'wishlist': wishlist,
    };
  }
}
