import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noon_app/constants/asset_constants.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int index, _) => BottomNavigationBar(
        currentIndex: index,
        onTap: (index) => indexChangeNotifier.value = index,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetGraphics.homeIcon),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetGraphics.categoriesIcon),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetGraphics.dealsBoxIcon),
            label: "Clearance Deals",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetGraphics.accountIcon),
            label: "My Account",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetGraphics.cartIcon),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
