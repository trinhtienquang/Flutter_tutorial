import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorSchema = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 181),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorSchema,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorSchema.onPrimaryContainer,
          foregroundColor: kColorSchema.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorSchema.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorSchema.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorSchema.onSecondaryContainer,
            fontSize: 16,
          ),
        ),
      ),
      home: Expenses(),
    ),
  );
}
