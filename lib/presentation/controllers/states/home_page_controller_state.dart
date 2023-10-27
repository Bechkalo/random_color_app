import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_controller_state.freezed.dart';

/// A Freezed class that represents the state of the HomePageController widget.
@freezed
class HomePageControllerState with _$HomePageControllerState {
  /// Factory constructor for the HomePageControllerState class.
  const factory HomePageControllerState({
    /// Show error on Home Page.
    @Default(false) bool isError,

    /// Change view of button.
    @Default(false) bool isPressedButton,

    /// Change color of background.
    @Default(Colors.white) Color selectedBackgroundColor,

    /// Change color of text.
    @Default(Colors.black) Color selectedTextColor,
  }) = _HomePageControllerState;
}
