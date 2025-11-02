import 'package:flutter/material.dart';
import 'package:proj_four/widges/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(68, 33, 65, 206));

void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.primary,
        ),
        cardTheme: CardThemeData().copyWith(
            color: kColorScheme.surfaceContainerHigh,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7))),
    home: Expenses(),
  ));
}
