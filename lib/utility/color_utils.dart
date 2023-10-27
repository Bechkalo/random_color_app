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
/// // Get list of primaries and accents colors.
/// List<Color> materialColors = ColorUtils.materialColors;
///
/// ```

class ColorUtils {
  static ColorUtils? _instance;

  /// Method for concatenating lists Colors.primaries and Colors.accents
  static List<Color> get materialColors =>
      <Color>[...Colors.primaries, ...Colors.accents];

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
