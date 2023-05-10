import 'package:flutter/material.dart';
import 'package:githubrepo/constants/colorgraphy.dart';

final ThemeData themeLight = ThemeData(
  useMaterial3: true,
  canvasColor: Colorgraphy().kBackgroundColor,
  colorScheme: const ColorScheme.light(),
  dividerTheme: const DividerThemeData(
    color: Colors.transparent,
  ),
);

final ThemeData themeDark = ThemeData(
  useMaterial3: true,
  canvasColor: Colorgraphy().kBackgroundColor,
  colorScheme: const ColorScheme.dark(),
  dividerTheme: const DividerThemeData(
    color: Colors.transparent,
  ),
);
