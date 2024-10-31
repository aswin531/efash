
class ShoppingItemData {
  final String name;
  final double originalPrice;
  final double discountPrice;
  final int discount;
  final String size;
  final String color;
  final String? imageUrl;

  ShoppingItemData(
      {required this.name,
      required this.originalPrice,
      required this.discountPrice,
      required this.discount,
      required this.color,
      required this.size,
      this.imageUrl
      });
}
