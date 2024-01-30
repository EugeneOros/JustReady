import 'package:flutter/material.dart';

extension ControllerExtension on TextEditingController {
  void moveCursorToEnd() {
    value = value.copyWith(
      text: value.text,
      selection: TextSelection.collapsed(offset: value.text.length),
    );
  }

  void selectAll() {
    selection = selection.copyWith(
      baseOffset: 0,
      extentOffset: text.length,
      affinity: selection.affinity,
    );
  }
}
