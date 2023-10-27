import 'package:flutter/material.dart';
import 'package:random_color_app/presentation/controllers/states/home_page_controller_state.dart';
import 'package:random_color_app/utility/collection_extensions.dart';
import 'package:random_color_app/utility/color_utils.dart';

/// A [ChangeNotifier] class that controls the state of the home page.
class HomePageController extends ChangeNotifier {
  /// Initialization of Home Page Controller State
  HomePageControllerState homePageControllerState =
      const HomePageControllerState();

  /// The state of the controller.
  HomePageControllerState get state => homePageControllerState;
  set state(HomePageControllerState state) => homePageControllerState = state;

  /// Generate new colors for text and background and set them to new state.
  void generateColors() {
    //Check for errors and dispose of them if they exist.
    homePageControllerState = homePageControllerState.copyWith(
      isError: false,
    );
    notifyListeners();

    try {
      // Get text and background colors.
      final oldBackgroundColor =
          homePageControllerState.selectedBackgroundColor;
      final oldTextColor = homePageControllerState.selectedTextColor;

      // Generate new colors for text and background.
      final newBackgroundColor =
          ColorUtils.materialColors.getRandom() ?? oldBackgroundColor;
      final newTextColor =
          ColorUtils.materialColors.getRandom() ?? oldTextColor;

      // Check if text color differs from background.
      final checkedTextColor = _checkColors(newBackgroundColor, newTextColor);

      // Set new values to the state of controller.
      homePageControllerState = homePageControllerState.copyWith(
        selectedBackgroundColor: newBackgroundColor,
        selectedTextColor: checkedTextColor,
      );
    } catch (e, _) {
      // We update state and show an error if it exists.
      homePageControllerState = homePageControllerState.copyWith(
        isError: true,
      );
    } finally {
      notifyListeners();
    }
  }

  /// Use to show button tap effect and generate new colors.
  void isButtonPressed({required bool isPressed}) {
    if (isPressed) {
      homePageControllerState = homePageControllerState.copyWith(
        isPressedButton: true,
      );
      notifyListeners();
    } else {
      homePageControllerState = homePageControllerState.copyWith(
        isPressedButton: false,
      );
      generateColors();
    }
  }
}

/// Returns lastColor if it differs from firstColor, otherwise starts again.
Color _checkColors(Color firstColor, Color lastColor) {
  //If they differs then return lastColor.
  if (firstColor.value != lastColor.value) {
    return lastColor;
  } else {
    // Generate new lastColor and check it again.
    final newLastColor = ColorUtils.materialColors.getRandom() ?? Colors.white;

    return _checkColors(firstColor, newLastColor);
  }
}
