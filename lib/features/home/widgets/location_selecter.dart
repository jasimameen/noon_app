import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noon_app/constants/asset_constants.dart';
import 'package:noon_app/common/views/carousal_view.dart';
import 'package:noon_app/constants/ui_constants.dart';

class LocationSelecter extends StatelessWidget {
  const LocationSelecter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          UIConstants.width10,

          // latn icon
          SvgPicture.asset(AssetGraphics.addressIcon),

          UIConstants.width10,

          // location text
          DropdownButton(
            underline: UIConstants.emptySpace,
            items: const [
              DropdownMenuItem(
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(text: 'Deliver to '),
                    TextSpan(
                        text: 'Dubai',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ]),
                ),
              ),
            ],
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
