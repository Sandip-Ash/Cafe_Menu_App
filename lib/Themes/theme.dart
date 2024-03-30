import 'package:coffee_app/Colors/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  iconTheme: IconThemeData(color: tdBlack),
  scaffoldBackgroundColor: tdBGColor
);

ThemeData darkTheme = ThemeData(
    iconTheme: IconThemeData(color: tdBGColor),
    scaffoldBackgroundColor: tdBlack,
);
