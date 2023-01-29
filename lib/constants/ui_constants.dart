import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/widgets/search_bar.dart';
import 'asset_constants.dart';

class UIConstants {
  UIConstants._();

  static AppBar appBar = AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
            AssetGraphics.noonLogo,
            height: 50,
            width: 100,
            alignment: Alignment.centerLeft,
          
        ),
        const Expanded(child: SearchBar()),
      ],
    ),
  );

  static const emptySpace = SizedBox();
  static const height5 = SizedBox(height: 5);
  static const height10 = SizedBox(height: 10);
  static const height20 = SizedBox(height: 20);
  static const height40 = SizedBox(height: 40);

  static const width3 = SizedBox(width: 3);
  static const width5 = SizedBox(width: 5);
  static const width10 = SizedBox(width: 10);
  static const width20 = SizedBox(width: 20);
  static const width40 = SizedBox(width: 40);
}
