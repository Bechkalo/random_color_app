import 'package:flutter/material.dart';
import 'package:random_color_app/utility/color_utils.dart';

/// A constant border radius of 100.0 pixels.
const borderRadius = 100.0;

/// A constant blur radius of 10.0 pixels for shadow of box.
const shadowBlurRadius = 10.0;

/// A constant offset value of 5.0 pixels for shadow of box.
const shadowOffsetValue = 5.0;

/// A constant interpolation value of 0.6 pixels for first shadow of box.
const firstShadowColorsInterpolation = 0.6;

/// A constant interpolation value of 0.3 pixels for second shadow of box.
const secondShadowColorsInterpolation = 0.3;

/// Widget that wraps another widget with a neumorphic UI.
class NeumorphicContainer extends StatelessWidget {
  /// The widget to wrap with this NeumorphicContainer.
  final Widget child;

  /// The color of NeumorphicContainer.
  final Color color;

  /// Update view of NeumorphicContainer.
  final bool isPressed;

  /// A constructor for the NeumorphicContainer class.
  const NeumorphicContainer({
    required this.child,
    required this.color,
    required this.isPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: _fetchGradientColors(isPressed, color),
          stops: const [0.0, 0.3, 0.6, 1.0],
        ),
        boxShadow: isPressed
            ? null
            : [
                BoxShadow(
                  blurRadius: shadowBlurRadius,
                  offset: -const Offset(shadowOffsetValue, shadowOffsetValue),
                  color: ColorUtils.mixColors(
                    Colors.white,
                    color,
                    firstShadowColorsInterpolation,
                  ),
                ),
                BoxShadow(
                  blurRadius: shadowBlurRadius,
                  offset: const Offset(shadowOffsetValue, shadowOffsetValue),
                  color: ColorUtils.mixColors(
                    Colors.black,
                    color,
                    secondShadowColorsInterpolation,
                  ),
                ),
              ],
      ),
      child: child,
    );
  }
}

/// Used for changing linear gradient colors when the container is pressed.
List<Color> _fetchGradientColors(bool isPressed, Color color) {
  final pointDown = [
    color,
    ColorUtils.mixColors(Colors.black, color, 0.7),
    ColorUtils.mixColors(Colors.black, color, 0.7),
    color,
  ];
  final pointUp = [
    ColorUtils.mixColors(Colors.black, color, 0.7),
    color,
    color,
    ColorUtils.mixColors(Colors.white, color, 0.7),
  ];

  return isPressed ? pointDown : pointUp;
}
