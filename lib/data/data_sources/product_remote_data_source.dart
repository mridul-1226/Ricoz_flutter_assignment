import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/core/error.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> fetchProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> fetchProducts() async {
    final response = await client.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      try {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        final List<dynamic> productJson = body['products'];
        return productJson.map((json) => ProductModel.fromJson(json)).toList();
      } catch (e) {
        throw const CustomError(errorMessage: 'Failed to parse product data');
      }
    } else {
      throw const CustomError(errorMessage: 'Failed to load products');
    }
  }
}
