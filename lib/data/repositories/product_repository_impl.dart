import 'package:shop_app/data/data_sources/product_remote_data_source.dart';
import 'package:shop_app/domain/entities/product.dart';
import 'package:shop_app/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>> getProducts() async {
    try {
      final productModels = await remoteDataSource.fetchProducts();
      return productModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to fetch products');
    }
  }
}
