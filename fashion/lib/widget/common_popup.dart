import 'package:flutter/material.dart';

import '../common/brand_color.dart';
import '../common/brand_text.dart';

class CommonPopup extends StatelessWidget {
  final String? text;
  final String? desc;
  final bool needDoubleButton;
  final String yesText;
  final String noText;
  final String okText;

  const CommonPopup({
    Key? key,
    this.text = "",
    this.desc = "",
    this.needDoubleButton = true,
    this.yesText = "Yes",
    this.noText = "No",
    this.okText = "OK",
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: BrandColor.glass,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              decoration: BoxDecoration(
                color: BrandColor.light,
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 52.0),
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  if (text != null && text != "")
                    BrandText.commonText(
                      text: text ?? "",
                      fontSize: 16.0,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      fontWeight: BrandText.bold,
                      letterSpacing: 0.5,
                    ),
                  /*  if (text != null && text != "")
                    Divider(
                      color: BrandColors.shadow,
                    ), */
                  if (text != null && text != "") const SizedBox(height: 16.0),
                  if (desc != null && desc != "")
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: BrandText.commonText(
                        text: desc ?? "",
                        fontSize: 16.0,
                        maxLines: 50,
                        textAlign: TextAlign.center,
                        letterSpacing: 0.5,
                      ),
                    ),
                  if (desc != null && desc != "") const SizedBox(height: 8.0),
                  Divider(color: BrandColor.ash),
                  needDoubleButton ? _doubleButton(context) : _singleButton(context),
                ],
              )),
        ],
      ),
    );
  }

  Widget _doubleButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(true),
            child: BrandText.commonText(
              text: yesText,
              maxLines: 2,
              color: BrandColor.dark,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
            height: 20.0,
            child: VerticalDivider(
              color: BrandColor.ash,
            )),
        Expanded(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: BrandText.commonText(
              text: noText,
              maxLines: 2,
              color: BrandColor.dark,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _singleButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(true),
            child: BrandText.commonText(
              text: okText,
              maxLines: 2,
              color: BrandColor.dark,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
