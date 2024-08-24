import 'package:shop_app/domain/entities/product.dart';

class ProductModel {
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

  ProductModel({
    required this.category,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.rating,
    required this.stock,
    required this.discountPercent,
    required this.images,
    required this.brand,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['title'],
      imageUrl: json['thumbnail'],
      price: json['price'],
      description: json['description'],
      rating: json['rating'],
      stock: json['stock'],
      discountPercent: json['discountPercentage'].toString(),
      category: json['category'],
      images: json['images'].toString(),
      brand: json['brand'].toString(),
    );
  }

  Product toEntity() {
    return Product(
      id: id,
      name: name,
      imageUrl: imageUrl,
      price: price,
      description: description,
      rating: rating,
      stock: stock,
      discountPercent: discountPercent,
      category: category,
      images: images,
      brand: brand,
    );
  }
}
