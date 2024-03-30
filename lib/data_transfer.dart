import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  bool isDark = false;

  void toggleSwitch(bool newValue) {
    isDark = newValue;
    notifyListeners(); // Notify the listeners (e.g., the UI) that the value has changed.
  }
}
