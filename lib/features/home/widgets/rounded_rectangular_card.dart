// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RoundedRectangularCard extends StatelessWidget {
  final String image;
  const RoundedRectangularCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      height: 190,
      width: 140,
      errorBuilder: (context, err, _) => Container(
        height: 190,
        width: 140,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
