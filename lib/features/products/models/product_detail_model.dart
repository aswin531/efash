// ignore_for_file: non_constant_identifier_names

class ProductDetailModel {
  final int success;
  final String message;
  final ProductDetail product;

  ProductDetailModel({
    required this.success,
    required this.message,
    required this.product,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
      success: json['success'] ?? 0,
      message: json['message'] ?? 'No Message',
      product: ProductDetail.fromJson(json['product']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'product': product.toJson(),
    };
  }
}

class ProductDetail {
  final String slug;
  final String code;
  final String description;
  final String name;
  final double oldPrice;
  final double price;
  final String image;
  final List<Option> options;
  final List<Image> images;

  ProductDetail({
    required this.slug,
    required this.code,
    required this.description,
    required this.name,
    required this.oldPrice,
    required this.price,
    required this.image,
    required this.options,
    required this.images,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      slug: json['slug'] ?? '',
      code: json['code'] ?? '',
      description: json['description'] ?? '',
      name: json['name'] ?? '',
      oldPrice: double.tryParse(json['oldprice']?.toString() ?? '0') ?? 0,
      price: double.tryParse(json['price']?.toString() ?? '0') ?? 0,
      image: json['images'][0]['image'] ?? '', // Default image
      options: (json['options'] as List)
          .map((i) => Option.fromJson(i))
          .toList(),
      images: (json['images'] as List)
          .map((i) => Image.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'code': code,
      'description': description,
      'name': name,
      'oldprice': oldPrice.toString(),
      'price': price.toString(),
      'image': image,
      'options': options.map((o) => o.toJson()).toList(),
      'images': images.map((img) => img.toJson()).toList(),
    };
  }
}

class Option {
  final int id;
  final String name;
  final List<Value> values;

  Option({
    required this.id,
    required this.name,
    required this.values,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      values: (json['values'] as List)
          .map((v) => Value.fromJson(v))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'values': values.map((v) => v.toJson()).toList(),
    };
  }
}

class Value {
  final int id;
  final String text;

  Value({
    required this.id,
    required this.text,
  });

  factory Value.fromJson(Map<String, dynamic> json) {
    return Value(
      id: json['id'] ?? '',
      text: json['text'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
    };
  }
}

class Image {
  final String imageUrl;

  Image({required this.imageUrl});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      imageUrl: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': imageUrl,
    };
  }
}
