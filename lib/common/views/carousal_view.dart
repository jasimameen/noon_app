// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarousalView extends StatefulWidget {
  final double? aspectRatio;
  const CarousalView({
    Key? key,
    this.aspectRatio,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CarousalViewState();
  }
}

class CarousalViewState extends State<CarousalView> {
  int currentPos = 0;
  List<String> listPaths = [
    "https://f.nooncdn.com/mpcms/EN0001/assets/78072a0d-1d6b-4fed-acfa-97e8d06fe7af.gif",
    "https://f.nooncdn.com/mpcms/EN0002/assets/f4f33297-9e7c-4951-accc-a6781f370526.gif",
    "https://f.nooncdn.com/mpcms/EN0001/assets/17270d86-efee-4af5-9174-2a47b7bd766b.png",
    "https://f.nooncdn.com/mpcms/EN0001/assets/85d93f76-c114-4cfe-b3af-0ebdac475781.jpg",
    "https://f.nooncdn.com/mpcms/EN0001/assets/5d5c168e-3c31-489a-8878-f827dc358656.png",
    "https://f.nooncdn.com/mpcms/EN0001/assets/78072a0d-1d6b-4fed-acfa-97e8d06fe7af.gif",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: listPaths.length,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: widget.aspectRatio ?? 20 / 9,
            autoPlayInterval: const Duration(seconds: 4),
            onPageChanged: (index, reason) {
              setState(() {
                currentPos = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) => ImageView(
            listPaths[index],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            listPaths.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              width: 20,
              height: 8.0,
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 2.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: currentPos == index
                    ? const Color.fromRGBO(0, 0, 0, 0.9)
                    : const Color.fromRGBO(0, 0, 0, 0.4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ImageView extends StatelessWidget {
  final String imgPath;

  const ImageView(this.imgPath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.network(imgPath),
        ));
  }
}
