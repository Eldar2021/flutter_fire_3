import 'package:flutter/material.dart';
import 'package:material_color_utilities/blend/blend.dart';

import 'custom_color.dart';
import 'page_transiotion.dart';

class CustomTheme {
  const CustomTheme({
    Key? key,
    required this.color,
    required this.mode,
  });

  final Color color;
  final bool mode;

  final pageTransitionsTheme = const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: NoAnimationPageTransitionsBuilder(),
      TargetPlatform.macOS: NoAnimationPageTransitionsBuilder(),
      TargetPlatform.windows: NoAnimationPageTransitionsBuilder(),
    },
  );

  Color custom(CustomColor custom) {
    if (custom.blend) {
      return blend(custom.color);
    } else {
      return custom.color;
    }
  }

  Color blend(Color targetColor) {
    return Color(
      Blend.harmonize(targetColor.value, color.value),
    );
  }

  Color source(Color? target) {
    Color source = color;
    if (target != null) {
      source = blend(target);
    }
    return source;
  }

  ColorScheme colors(Brightness brightness, Color? targetColor) {
    // final dynamicPrimary = brightness == Brightness.light
    //     ? lightDynamic?.primary
    //     : darkDynamic?.primary;
    return ColorScheme.fromSeed(
      seedColor: source(targetColor),
      brightness: brightness,
    );
  }

  ShapeBorder get shapeMedium => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      );

  CardTheme cardTheme() {
    return CardTheme(
      elevation: 0,
      shape: shapeMedium,
      clipBehavior: Clip.antiAlias,
    );
  }

  ButtonThemeData buttonTheme(ColorScheme colors) {
    return ButtonThemeData(
      buttonColor: colors.primary,
    );
  }

  ElevatedButtonThemeData elevatedButtonThemeData(ColorScheme colors) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colors.onTertiary),
      ),
    );
  }

  InputDecorationTheme inputDecorationTheme(ColorScheme colors) {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: colors.primary,
        ),
      ),
    );
  }

  ListTileThemeData listTileTheme(ColorScheme colors) {
    return ListTileThemeData(
      shape: shapeMedium,
      selectedColor: colors.secondary,
    );
  }

  AppBarTheme appBarTheme(ColorScheme colors) {
    return AppBarTheme(
      elevation: 0,
      backgroundColor: colors.surfaceVariant,
      foregroundColor: colors.onSurface,
    );
  }

  TabBarTheme tabBarTheme(ColorScheme colors) {
    return TabBarTheme(
      labelColor: colors.secondary,
      unselectedLabelColor: colors.onSurfaceVariant,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colors.secondary,
            width: 2,
          ),
        ),
      ),
    );
  }

  BottomAppBarTheme bottomAppBarTheme(ColorScheme colors) {
    return BottomAppBarTheme(
      color: colors.surface,
      elevation: 0,
    );
  }

  BottomNavigationBarThemeData bottomNavigationBarTheme(ColorScheme colors) {
    return BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colors.surfaceVariant,
      selectedItemColor: colors.onSurface,
      unselectedItemColor: colors.onSurfaceVariant,
      elevation: 0,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    );
  }

  NavigationRailThemeData navigationRailTheme(ColorScheme colors) {
    return const NavigationRailThemeData();
  }

  DrawerThemeData drawerTheme(ColorScheme colors) {
    return DrawerThemeData(
      backgroundColor: colors.surface,
    );
  }

  ThemeData light([Color? targetColor]) {
    final scheme = colors(Brightness.light, targetColor);
    return ThemeData.light().copyWith(
      pageTransitionsTheme: pageTransitionsTheme,
      colorScheme: scheme,
      appBarTheme: appBarTheme(scheme),
      cardTheme: cardTheme(),
      listTileTheme: listTileTheme(scheme),
      bottomAppBarTheme: bottomAppBarTheme(scheme),
      bottomNavigationBarTheme: bottomNavigationBarTheme(scheme),
      navigationRailTheme: navigationRailTheme(scheme),
      tabBarTheme: tabBarTheme(scheme),
      drawerTheme: drawerTheme(scheme),
      buttonTheme: buttonTheme(scheme),
      inputDecorationTheme: inputDecorationTheme(scheme),
      elevatedButtonTheme: elevatedButtonThemeData(scheme),
      // scaffoldBackgroundColor: scheme.background,
      useMaterial3: true,
    );
  }

  ThemeData dark([Color? targetColor]) {
    final scheme = colors(Brightness.dark, targetColor);
    return ThemeData.dark().copyWith(
      pageTransitionsTheme: pageTransitionsTheme,
      colorScheme: scheme,
      appBarTheme: appBarTheme(scheme),
      cardTheme: cardTheme(),
      listTileTheme: listTileTheme(scheme),
      bottomAppBarTheme: bottomAppBarTheme(scheme),
      bottomNavigationBarTheme: bottomNavigationBarTheme(scheme),
      navigationRailTheme: navigationRailTheme(scheme),
      tabBarTheme: tabBarTheme(scheme),
      drawerTheme: drawerTheme(scheme),
      buttonTheme: buttonTheme(scheme),
      inputDecorationTheme: inputDecorationTheme(scheme),
      elevatedButtonTheme: elevatedButtonThemeData(scheme),
      // scaffoldBackgroundColor: scheme.background,
      useMaterial3: true,
    );
  }

  // ThemeData theme(BuildContext context, [Color? targetColor]) {
  //   final brightness = MediaQuery.of(context).platformBrightness;
  //   return brightness == Brightness.light
  //       ? light(targetColor)
  //       : dark(targetColor);
  // }
  ThemeData get theme => mode ? light() : dark();

  CustomTheme copy({Color? newColor, bool? newMode}) {
    return CustomTheme(color: newColor ?? color, mode: newMode ?? mode);
  }
}
