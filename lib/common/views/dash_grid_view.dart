// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../constants/ui_constants.dart';

class DashGridView extends StatelessWidget {
  final String? title;
  final Widget? trailing;
  final List<String> images;

  const DashGridView({
    Key? key,
    this.title,
    this.trailing,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: double.infinity,
      color: const Color.fromARGB(255, 255, 240, 190),
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                trailing ?? UIConstants.emptySpace,
              ],
            ),
          ),
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              children: List.generate(
                images.length,
                (index) => Image.network(images[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
