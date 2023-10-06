import 'package:desafio/app/core/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

sealed class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    useMaterial3: true,
    iconTheme: const IconThemeData(color: AppColor.white),
    cardTheme: CardTheme(
        color: AppColor.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        )),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    appBarTheme: const AppBarTheme(centerTitle: true),
    textTheme: GoogleFonts.openSansTextTheme(),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColor.black,
        side: const BorderSide(color: AppColor.blue, width: 1),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
