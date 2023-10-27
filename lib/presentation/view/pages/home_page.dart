import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:random_color_app/presentation/controllers/home_page/home_page_controller.dart';
import 'package:random_color_app/presentation/view/common_widgets/neumorphic_container.dart';

/// A constant maximum number of lines in the text of 2.
const textMaxLines = 2;

/// This widget is the main page of application.
class HomePage extends StatefulWidget {
  /// A constructor for the HomePage class.
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController screenController = HomePageController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageController>.value(
      value: screenController,
      child: Consumer<HomePageController>(
        builder: (context, controller, child) {
          // We use a [Listener] to detect when the user
          // presses up and down on the screen.
          return Stack(
            children: [
              Listener(
                onPointerDown: (_) {
                  controller.isButtonPressed(isPressed: true);
                },
                onPointerUp: (_) {
                  controller.isButtonPressed(isPressed: false);
                },
                child: Material(
                  color: controller.state.selectedBackgroundColor,
                  child: SafeArea(
                    child: Center(
                      child: NeumorphicContainer(
                        color: controller.state.selectedBackgroundColor,
                        isPressed: controller.state.isPressedButton,
                        child: Text(
                          "Hello there",
                          style: TextStyle(
                            color: controller.state.selectedTextColor,
                            fontWeight: FontWeight.w700,
                          ),
                          // To avoid text overflow,
                          // we use the following arguments
                          maxLines: textMaxLines,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Error state
              if (controller.state.isError)
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: controller.state.isError ? 1 : 0,
                  child: Material(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Something went wrong'),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: () {
                              controller.generateColors();
                            },
                            child: const Text("Try again"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    screenController.dispose();
    super.dispose();
  }
}
