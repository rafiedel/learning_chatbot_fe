import 'package:flutter/material.dart';

import '../../themes/_themes.dart';

class TextInputDecorator {
  TextInputDecorator() {
    _inputDecoration = const InputDecoration();
  }

  late InputDecoration _inputDecoration;

  InputDecoration defaultDecoration() {
    return _inputDecoration.copyWith();
  }

  static InputDecoration form(
    String labelText,
    String hint, {
    Widget? suffixIcon,
    bool isRequired = false,
  }) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      hintText: hint,
      hintStyle: FontTheme.poppins24w500black().copyWith(
        color: BaseColors.purpleHearth,
      ),
      border: InputBorder.none,
    );
  }
}
