import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data/data_sources/product_remote_data_source.dart';
import 'package:shop_app/data/repositories/product_repository_impl.dart';
import 'package:shop_app/domain/use_cases/get_products.dart';
import 'package:shop_app/presentation/bloc/bloc/product_bloc.dart';
import 'package:shop_app/presentation/pages/home_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(
        GetProducts(
          ProductRepositoryImpl(
            remoteDataSource: ProductRemoteDataSourceImpl(
              client: http.Client(),
            ),
          ),
        ),
      )..add(LoadProductsEvent()),
      child: const MaterialApp(
        title: 'E-commerece',
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
