class Product {
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  final String description;
  final double rating;
  final int stock;
  final String discountPercent;
  final String category;
  final String images;
  final String brand;

  Product({
    required this.category,
    required this.rating,
    required this.stock,
    required this.discountPercent,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.images,
    required this.brand
  });
}
