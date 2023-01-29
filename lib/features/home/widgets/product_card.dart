// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avif/flutter_avif.dart';

import 'package:noon_app/constants/ui_constants.dart';
import 'package:noon_app/features/home/widgets/badge_text.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          ImageContainer(
            image: product.image,
            bestSeller: product.bestSeller,
          ),

          UIConstants.height10,

          // title
          Text(
            product.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),

          UIConstants.height10,

          // price
          Text('AED ${product.price}'),
          // discount price
          Text.rich(
            TextSpan(
              children: [
                // old price - strikethrough
                TextSpan(
                  text: '${product.oldPrice}',
                  style:
                      const TextStyle(decoration: TextDecoration.lineThrough),
                ),

                // discound percentage
                TextSpan(
                  text: '${product.discountPercentage}% OFF',
                  style: const TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),

          UIConstants.height40,

          Row(
            children: const [
              // express
              BadgeText(
                text: ' express ',
                textColor: Colors.black,
                background: Colors.yellow,
              ),
              UIConstants.width3,
              BadgeText(
                text: ' 4.5 ',
                background: Colors.green,
                trailing: Icon(
                  CupertinoIcons.star_fill,
                  color: Colors.white,
                ),
              ),
              UIConstants.width3,
              Text('(115)', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String image;
  final bool bestSeller;
  const ImageContainer({
    Key? key,
    required this.image,
    this.bestSeller = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // product image
        Container(
          height: 190,
          width: 140,
          decoration: const BoxDecoration(color: Colors.grey),
          child: AvifImage.network(image, fit: BoxFit.cover),
        ),

        // best seller tag
        bestSeller
            ? const BadgeText(text: 'Best Seller')
            : UIConstants.emptySpace,
      ],
    );
  }
}

class Product {
  final String image;
  final String title;
  final double price;
  final double oldPrice;
  final int discountPercentage;
  final double rating;
  final int reviews;
  final bool bestSeller;

  const Product({
    required this.image,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.discountPercentage,
    required this.rating,
    required this.reviews,
    this.bestSeller = false,
  });

  Product copyWith({
    String? image,
    String? title,
    double? price,
    double? oldPrice,
    int? discountPercentage,
    double? rating,
    int? reviews,
    bool? bestSeller,
  }) {
    return Product(
      image: image ?? this.image,
      title: title ?? this.title,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
      bestSeller: bestSeller ?? this.bestSeller,
    );
  }
}
