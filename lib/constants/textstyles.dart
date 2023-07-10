import 'package:flutter/material.dart';
import 'package:diction/constants/colors.dart';
import 'fonts.dart';

class TextStyles {
  static const TextStyle h1 = TextStyle(
      fontSize: FontSize.xXXL,
      fontWeight: Weight.bold,
      color: ApplicationColors.black);
  static const TextStyle h2 = TextStyle(
      fontSize: FontSize.xL,
      fontWeight: Weight.bold,
      color: ApplicationColors.black);
  static const TextStyle h3 = TextStyle(
      fontSize: FontSize.M,
      fontWeight: Weight.heavy,
      color: ApplicationColors.primaryColor);
  static const TextStyle greyText = TextStyle(
      fontSize: FontSize.M,
      fontWeight: Weight.normal,
      color: ApplicationColors.grey);
  static TextStyle bodyText = const TextStyle(
      fontSize: FontSize.M,
      fontWeight: Weight.normal,
      color: ApplicationColors.black);
  static TextStyle smallText = const TextStyle(
      fontSize: FontSize.S,
      fontWeight: Weight.normal,
      color: ApplicationColors.primaryColor);
}
