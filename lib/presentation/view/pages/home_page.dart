import 'package:flutter/material.dart';
import 'package:random_color_app/presentation/view/common_widgets/neumorphic_container.dart';
import 'package:random_color_app/utility/collection_extensions.dart';
import 'package:random_color_app/utility/color_utils.dart';

/// This widget is the main page of application.
class HomePage extends StatefulWidget {
  /// A constructor for the HomePage class.
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isPressed = true;
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    // We use a [Listener] to detect when the user
    // presses up and down on the screen.
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Material(
        color: color,
        child: SafeArea(
          child: Center(
            child: NeumorphicContainer(
              color: color,
              isPressed: _isPressed,
              child: const Text(
                "Hello World!",
                // To avoid text overflow, we use the following arguments
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onPointerDown(_) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(_) {
    setState(() {
      _isPressed = false;
      final newColor = ColorUtils.materialColors.getRandom() ?? Colors.black;
      color = newColor;
    });
  }
}
