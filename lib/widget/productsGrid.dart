import 'package:flutter/material.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (_, index) {
        return Image.asset('assets/images/${index + 1}.png');
      },
      itemCount: 6,
    );
  }
}
