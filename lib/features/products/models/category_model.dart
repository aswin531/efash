
class Category {
  final int id;
  final String slug;
  final String image;
  final String name;
  final String description;

  Category(
      {required this.id,
      required this.slug,
      required this.image,
      required this.name,
      required this.description});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'] ?? 5,
        slug: json['slug'] ?? '',
        image: json['image'] ?? 'Image',
        name: json['name'] ?? '',
        description: json['description'] ?? 'IMAGE');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'image': image,
      'name': name,
      'description': description
    };
  }
}

