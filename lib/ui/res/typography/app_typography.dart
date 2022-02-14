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

  static const TextStyle regular18Black = TextStyle(
      fontFamily: _fontFamily,
      fontSize: 18,
      color: ProjectColors.black,
      fontWeight: FontWeight.w400);

  static const TextStyle normal14GreyUnderlined = TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      color: ProjectColors.lightGray,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline);

  static const TextStyle normal14Black = TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      color: ProjectColors.black,
      fontWeight: FontWeight.w500);

  static const TextStyle normal10Black = TextStyle(
      fontFamily: _fontFamily,
      fontSize: 10,
      color: ProjectColors.black,
      fontWeight: FontWeight.w400);

  static const TextStyle normal16Gray = TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      color: ProjectColors.usualGray,
      fontWeight: FontWeight.w500);

  static const TextStyle semibold32White = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    color: ProjectColors.lightGray,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle normal14White = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    color: ProjectColors.lightGray,
    fontWeight: FontWeight.w400,
  );
}
