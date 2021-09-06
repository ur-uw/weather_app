import 'package:flutter/material.dart';
import 'package:get/get.dart';

Text text(
  String text, {
  Color? textColor,
  FontWeight? fontWeight,
  double? fontSize,
  String? fontFamily,
  FontStyle? fontStyle,
  double? letterSpacing,
  TextDirection? textDirection,
  TextAlign? textAlign,
  TextStyle? textStyle,
  int? maxLines,
  double? wordSpacing,
  double? lineHeight,
}) {
  return Text(
    text.tr,
    textDirection: textDirection,
    textAlign: textAlign,
    maxLines: maxLines,
    style: textStyle ??
        TextStyle(
          wordSpacing: wordSpacing,
          color: textColor,
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontStyle: fontStyle,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          height: lineHeight,
        ),
  );
}
