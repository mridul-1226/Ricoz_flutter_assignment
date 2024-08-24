import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/utils.dart';
import 'package:shop_app/domain/entities/product.dart';
import 'package:shop_app/presentation/widgets/product_rating.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0.0;
  double _scrollMax = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.position.pixels;
        _scrollMax = _scrollController.position.maxScrollExtent;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final String title = widget.product.category;
    final finalPrice = (100 - double.parse(widget.product.discountPercent)) *
        widget.product.price *
        0.01;
    final List<String> images = widget.product.images
        .substring(1, widget.product.images.length - 1)
        .split(',');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text(
            '${title[0].toUpperCase()}${title.substring(1)}',
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Color(0xFF222222)),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(CupertinoIcons.back),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            ),
          ],
          elevation: 0,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 300,
                      width: constraints.maxWidth,
                      child: Stack(
                        children: [
                          ListView(
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            children: images.map(
                              (imageUrl) {
                                return Container(
                                  width: constraints.maxWidth - 20,
                                  margin: const EdgeInsets.only(right: 4),
                                  alignment: Alignment.center,
                                  child: Image.network(
                                    imageUrl.trim().replaceAll("'", ""),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: ScrollIndicator(
                                scrollPosition: _scrollPosition,
                                scrollMax: _scrollMax,
                                containerWidth: constraints.maxWidth,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.brand,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF222222),
                          ),
                        ),
                        Text(
                          '${finalPrice.toStringAsFixed(2)}\$',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF9B9B9B),
                      ),
                    ),
                    SizedBox(
                      width: 78,
                      child: ProductRating(
                        stock: widget.product.stock,
                        rating: 5 - widget.product.rating.round(),
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Text(
                      widget.product.description,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF222222),
                      ),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          color: Colors.white,
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            height: 48,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFDB3022),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Text(
              'ADD TO CART',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
