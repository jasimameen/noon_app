// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:noon_app/constants/ui_constants.dart';

class CategaryVerticalCard extends StatelessWidget {
  final String label;

  /// assetImage
  final String image;

  const CategaryVerticalCard({
    Key? key,
    required this.label,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategaryCard(label: label, image: image),
        UIConstants.height40,
        CategaryCard(label: label, image: image),
      ],
    );
  }
}

class CategaryCard extends StatelessWidget {
  final String label;

  /// assetImage
  final String image;

  const CategaryCard({
    Key? key,
    required this.label,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 35,
          backgroundColor: Colors.grey,
          // child: Image.asset(image, fit: BoxFit.contain),
        ),

        UIConstants.height10,

        // text
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
