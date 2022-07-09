import 'package:fashion/common/brand_color.dart';
import 'package:flutter/material.dart';

class BrandText {
  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight bold = FontWeight.w700;
  // common text
  static Text commonText({
    required String text,
    int maxLines = 1,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    double fontSize = 18.0,
    double letterSpacing = 0.2,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign ?? TextAlign.start,
      style: textStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight ?? regular,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,
      ),
    );
  }

  // text common style
  static TextStyle textStyle({
    double fontSize = 16.0,
    FontWeight? fontWeight,
    Color? color,
    bool isCrossText = false,
    bool isUnderlineText = false,
    double letterSpacing = 0.2,
    double? height,
    FontStyle fontStyle = FontStyle.normal,
  }) =>
      TextStyle(
          fontStyle: fontStyle,
          fontSize: fontSize,
          fontWeight: fontWeight ?? regular,
          letterSpacing: letterSpacing,
          color: color ?? BrandColor.dark,
          height: height,
          decoration: isCrossText
              ? TextDecoration.lineThrough
              : isUnderlineText
                  ? TextDecoration.underline
                  : TextDecoration.none);
}
