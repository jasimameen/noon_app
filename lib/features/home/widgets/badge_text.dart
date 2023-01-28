// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:noon_app/constants/ui_constants.dart';

class BadgeText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Widget? trailing;
  final Color? background;
  const BadgeText({
    Key? key,
    required this.text,
    this.textColor,
    this.trailing,
    this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: background ?? const Color.fromARGB(1, 64, 69, 83),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          // text data
          Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontFamily: 'Raleway',
            ),
          ),

          // trailing data
          trailing ?? UIConstants.emptySpace,
        ],
      ),
    );
  }
}
