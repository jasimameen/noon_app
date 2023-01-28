// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:noon_app/common/views/carousal_view.dart';
import 'package:noon_app/common/views/dash_grid_view.dart';
import 'package:noon_app/common/views/horizontal_scroll_view.dart';
import 'package:noon_app/constants/dummy.dart';
import 'package:noon_app/constants/ui_constants.dart';
import 'package:noon_app/features/home/widgets/badge_text.dart';
import 'package:noon_app/features/home/widgets/banner_ad.dart';
import 'package:noon_app/features/home/widgets/catogary_vertical_card.dart';
import 'package:noon_app/features/home/widgets/fasion_header.dart';
import 'package:noon_app/features/home/widgets/rounded_rectangular_card.dart';
import 'package:noon_app/features/home/widgets/location_selecter.dart';
import 'package:noon_app/features/home/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.appBar,
      body: Center(
        child: ListView(
          children: [
            // location selecter
            const LocationSelecter(),

            // hotdeals
            const CarousalView(),

            // all catogaries
            HorizontalScrollView(
              itemBuilder: (context, index) => CategaryVerticalCard(
                label: 'untitled $index',
                image: '',
              ),
              separator: UIConstants.width20,
              itemCount: 10,
              color: const Color.fromARGB(255, 249, 247, 123),
            ),

            // recommended for you
            const _ProductCardsSection(title: 'Recomended for you'),

            // mega deals of the day
            const DashGridView(
              title: 'MEGA DEALS OF THE DAY',
              images: Dummy.megaDealsList,
              trailing:
                  BadgeText(text: '24 hours only', background: Colors.red),
            ),

            UIConstants.height5,

            // deals only on noon
            const DashGridView(
              title: 'DEALS ONLY ON NOON',
              images: Dummy.noonDealsList,
            ),

            UIConstants.height10,

            // product ads
            const LimitedBox(
              maxHeight: 200,
              maxWidth: double.maxFinite,
            ),

            // trending electronic deals
            const _ProductCardsSection(title: 'Trending deals in electronics'),

            // explore more
            HorizontalScrollView(
              title: 'Explore More',
              color: const Color.fromARGB(255, 249, 247, 123),
              itemBuilder: (context, index) =>
                  RoundedRectangularCard(image: Dummy.exploreImages[index]),
              itemCount: Dummy.exploreImages.length,
            ),

            // clearance deal
            const _ProductCardsSection(title: 'clearance deals'),

            // grocery
            HorizontalScrollView(
              color: const Color.fromARGB(255, 116, 188, 118),
              itemBuilder: (context, index) =>
                  RoundedRectangularCard(image: Dummy.groceryImages[index]),
              itemCount: Dummy.exploreImages.length,
              separator: UIConstants.width40,
            ),

            UIConstants.height10,

            // ad
            const BannerAd(image: Dummy.bannerAd),

            // noon brand deals
            const _ProductCardsSection(title: 'Noon brand deals'),

            // womens fashion
            const _FashionCardSection(
              title: "WOMENS'S FASHION",
              itemList: Dummy.fashionwomenImgs,
            ),

            // mens fashion
            const _FashionCardSection(
              title: "MENS'S FASHION",
              itemList: Dummy.fashionmensImgs,
            ),

            // kids fashion
            const _FashionCardSection(
              title: "KID'S FASHION",
              itemList: Dummy.fashionkidsImgs,
            ),

            // ad
            const BannerAd(image: Dummy.bannerAd),

            // electronics
          ],
        ),
      ),
    );
  }
}

class _ProductCardsSection extends StatelessWidget {
  final String title;
  const _ProductCardsSection({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizontalScrollView(
      height: 400,
      title: title,
      itemBuilder: (context, index) =>
          const ProductCard(product: Dummy.dummyProduct),
      itemCount: 10,
      trailing: OutlinedButton(
        onPressed: () {},
        child: const Text('View All'),
      ),
    );
  }
}

class _FashionCardSection extends StatelessWidget {
  final String title;
  final List<String> itemList;
  const _FashionCardSection({
    Key? key,
    required this.title,
    required this.itemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizontalScrollView(
      height: 300,
      color: Color.fromARGB(255, 246, 211, 223),
      header: FasionHeader(title: title),
      itemBuilder: (context, index) =>
          RoundedRectangularCard(image: itemList[index]),
      itemCount: itemList.length,
    );
  }
}
