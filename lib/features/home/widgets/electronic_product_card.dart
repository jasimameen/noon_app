// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ElectronicProductCard extends StatelessWidget {
  final ElectronicProduct product;
  const ElectronicProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 120,
      child: Column(
        children: [
          // image
          Image.network(product.image),

          // shows the product title. hence here the image already contains text
          const Text(''),
        ],
      ),
    );
  }
}

class ElectronicProduct {
  final String title;
  final String image;

  const ElectronicProduct({
    required this.title,
    required this.image,
  });
}
