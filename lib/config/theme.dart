import 'package:flutter/material.dart';
import 'package:sampark/config/colors.dart';

var lightTheme = ThemeData();
var darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    primary: dPrimarColor,
    onPrimary: dBackgroundColor,
    surface: dBackgroundColor,
    onSurface: donContainerColor,
    primaryContainer: dContainerColor,
    onPrimaryContainer: dOnBackgroundColor,
  ),
);
