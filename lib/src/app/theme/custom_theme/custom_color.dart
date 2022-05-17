import 'package:flutter/material.dart';

import 'custom_theme.dart';

class CustomColor {
  const CustomColor({
    required this.name,
    required this.color,
    this.blend = true,
  });

  final String name;
  final Color color;
  final bool blend;

  Color value(CustomTheme provider) {
    return provider.custom(this);
  }
}

const linkColor = CustomColor(
  name: 'Link Color',
  color: Color(0xFF00B0FF),
);
