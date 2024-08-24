import 'package:flutter/material.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({super.key, required this.stock, required this.rating});
  final int stock;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Center(
              child: Text(
                '($stock)',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF9B9B9B),
                ),
              ),
            );
          }
          return Icon(
            Icons.star_rate_rounded,
            size: 12,
            color: rating < index ? const Color(0xFFFFBA49) : Colors.grey,
          );
        },
        itemCount: 6,
      ),
    );
  }
}
