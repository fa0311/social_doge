import 'package:flutter/material.dart';

ThemeData blackTheme() {
  const black = Color.fromARGB(255, 0, 0, 0);
  const grey = Color.fromARGB(255, 20, 20, 20);
  return ThemeData(
    brightness: Brightness.dark,
    canvasColor: grey,
    cardColor: grey,
    dialogBackgroundColor: black,
    primaryColor: black,
    primaryColorDark: black,
    primaryColorLight: black,
    scaffoldBackgroundColor: black,
    secondaryHeaderColor: black,
    appBarTheme: const AppBarTheme(color: grey),
    bottomAppBarTheme: const BottomAppBarTheme(color: black),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey, brightness: Brightness.dark).copyWith(background: black),
  );
}

ThemeData trueBlackTheme() {
  const black = Color.fromARGB(255, 0, 0, 0);
  return ThemeData(
    brightness: Brightness.dark,
    canvasColor: black,
    cardColor: black,
    dialogBackgroundColor: black,
    highlightColor: const Color.fromARGB(150, 20, 20, 20),
    primaryColor: black,
    primaryColorDark: black,
    primaryColorLight: black,
    scaffoldBackgroundColor: black,
    secondaryHeaderColor: black,
    splashColor: const Color.fromARGB(255, 20, 20, 20),
    appBarTheme: const AppBarTheme(color: black),
    bottomAppBarTheme: const BottomAppBarTheme(color: black),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey, brightness: Brightness.dark).copyWith(background: black),
  );
}

ThemeData highContrastLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.highContrastLight(),
  );
}

ThemeData highContrastDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.highContrastDark(),
  );
}
