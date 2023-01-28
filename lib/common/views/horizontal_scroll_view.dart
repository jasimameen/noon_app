// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:noon_app/constants/ui_constants.dart';

class HorizontalScrollView extends StatelessWidget {
  final double height;
  final String? title;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget? separator;
  final Widget? trailing;
  final int itemCount;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  final Widget? header;

  const HorizontalScrollView({
    Key? key,
    this.height = 250,
    this.title,
    required this.itemBuilder,
    this.separator,
    this.trailing,
    required this.itemCount,
    this.padding,
    this.color,
    this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var showDefaultHeader =
        header == null && (title != null || trailing != null);

    return Container(
      height: height,
      padding: padding ?? const EdgeInsets.all(8),
      decoration: BoxDecoration(color: color),
      child: Column(
        children: [
          // header
          showDefaultHeader
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                )
              : header ?? UIConstants.emptySpace,

          // scroll view
          Flexible(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: itemBuilder,
              separatorBuilder: (context, index) =>
                  separator ?? UIConstants.width10,
              itemCount: itemCount,
            ),
          ),
        ],
      ),
    );
  }
}
