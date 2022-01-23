import 'dart:ui';

import 'package:flutter/material.dart';

import '../colors/colors.dart';

abstract class AppTypography {
  static const String _fontFamily = 'sfprodisplay';

  static const TextStyle normal18Black = TextStyle(
      fontFamily: _fontFamily,
      fontSize: 18,
      color: ProjectColors.black,
      fontWeight: FontWeight.w600);

  static const TextStyle normal14GreyUnderlined = TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      color: ProjectColors.lightGray,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline);

  static const TextStyle semibold32White = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    color: ProjectColors.lightGray,
    fontWeight: FontWeight.w700,
  );
}
