import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier
{
  ThemeMode mode=ThemeMode.light;
  void switchmode(ThemeMode value)
  {
    mode=value;
    notifyListeners();
  }
}