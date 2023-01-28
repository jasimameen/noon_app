// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:noon_app/constants/ui_constants.dart';

class FasionHeader extends StatelessWidget {
  final String title;
  const FasionHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Column(
          children: [
            Container(height: 35, width: double.infinity, color: Colors.black),
            const SizedBox(height: 35)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '50-80% OFF',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                UIConstants.height5,
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),

            // trailing button
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: const Text('SHOP NOW'),
            ),

            UIConstants.width10,
          ],
        ),
      ],
    );
  }
}
