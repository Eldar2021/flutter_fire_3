import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;
  static AppColors get instance {
    _instance ??= AppColors._init();
    return _instance!;
  }

  AppColors._init();

  final themeColors = const <Color>[
    Color(0xFF6237EA),
    Color(0xFF1B0062),
    Color(0xFFBB064A),
    Color(0xFFFFFFFF),
    Color(0xFF31009B),
    Color(0xFF000000),
    Color(0xFF8C1D18),
    Color(0xFFF9DEDC),
    Color(0xFF49454F),
    Color(0xFF900035),
    Color(0xFF760B93),
    Color(0xFF4905D3),
    Color(0xFF9130AD),
    Color(0xFF6237EA),
    Color(0xFF1B0062),
    Color(0xFFBB064A),
    Color(0xFFFFFFFF),
    Color(0xFF31009B),
    Color(0xFF000000),
    Color(0xFF8C1D18),
    Color(0xFFF9DEDC),
    Color(0xFF49454F),
    Color(0xFF900035),
    Color(0xFF760B93),
    Color(0xFF4905D3),
    Color(0xFF9130AD)
  ];
}
