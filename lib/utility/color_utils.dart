import 'package:flutter/material.dart';

/// Utility functions for working with colors.
///
///
/// Example usage:
///
/// ```dart
/// import 'color_utils.dart';
///
/// // Mix two colors together.
/// Color mixedColor = ColorUtils.mixColors(Colors.white, Colors.black, 0.5);
///
/// ```

class ColorUtils {
  static ColorUtils? _instance;

  /// Factory constructor for the `ColorUtils` class.
  ///
  /// Returns a singleton instance of the `ColorUtils` class.
  factory ColorUtils() {
    return _instance ??= ColorUtils._();
  }

  ColorUtils._();

  ///Change [Color.lerp] for handling null color
  static Color mixColors(
    Color? firstColor,
    Color? lastColor,
    double interpolation, {
    Color defaultColor = Colors.white,
  }) {
    return Color.lerp(firstColor, lastColor, interpolation) ?? defaultColor;
  }
}
