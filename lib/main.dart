import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy_favourite_places/screen/places.dart';

import 'Theme/theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Groceries',
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: ThemeData.dark().appBarTheme.copyWith(
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
          backgroundColor: kDarkColorScheme.primaryContainer,
        ),
        cardTheme: ThemeData.dark().cardTheme.copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        ),
        textTheme: ThemeData.dark().textTheme.copyWith(
          titleSmall: GoogleFonts.ubuntuCondensed(
            fontWeight: FontWeight.bold,
          ),
          titleMedium: GoogleFonts.ubuntuCondensed(
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.ubuntuCondensed(
            fontWeight: FontWeight.bold,
            color: kDarkColorScheme.onSecondaryContainer,

          ),
        ),

      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: ThemeData().appBarTheme.copyWith(
          foregroundColor: kColorScheme.onPrimaryContainer,
          backgroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: ThemeData().cardTheme.copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: kColorScheme.onSecondaryContainer,),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const PlaceScreen(),
    );
  }
}


