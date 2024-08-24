import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  final String pageName;
  const OtherPage({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        pageName,
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}
