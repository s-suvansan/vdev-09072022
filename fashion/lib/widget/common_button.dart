import 'package:flutter/material.dart';

import '../common/brand_color.dart';
import '../common/brand_text.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const CommonButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          decoration: BoxDecoration(
              color: BrandColor.ash.withOpacity(0.4),
              border: Border.all(
                color: BrandColor.dark,
                width: 1.5,
              )),
          child: BrandText.commonText(text: text),
        ));
  }
}
