class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String image;
  final String? size;
  final String? color;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.image,
    this.color,
    this.size,
  });
}

class CartPackageItem {
  final String id;
  final String title;
  final String subtitle;
  final double price;
  final double percentage;
  final String image;
  final Map<String, dynamic> data;

  CartPackageItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.percentage,
    required this.image,
    required this.data,
  });
}