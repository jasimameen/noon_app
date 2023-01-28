import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoTextField(
      placeholder: 'What are you looking for?',
      suffix: Icon(CupertinoIcons.search, color: Colors.grey),
    );
  }
}
