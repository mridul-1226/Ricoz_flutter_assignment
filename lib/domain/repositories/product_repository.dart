import 'package:shop_app/domain/entities/product.dart';

abstract interface class ProductRepository {
   Future<List<Product>> getProducts();
}