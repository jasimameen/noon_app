import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/asset_constants.dart';

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
            icon:
                Image.asset(AssetGraphics.dealsBoxIcon, height: 30, width: 30),
            label: "Clearance\n    Deals",
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
