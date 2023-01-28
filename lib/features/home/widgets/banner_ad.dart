// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:noon_app/constants/ui_constants.dart';

class BannerAd extends StatelessWidget {
  final String image;
  const BannerAd({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      loadingBuilder: (context, child, _) => UIConstants.emptySpace,
      errorBuilder: (context, err, _) => UIConstants.emptySpace,
    );
  }
}
