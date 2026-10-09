import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const ink = Color(0xFF0F1B2D);
const bg = Color(0xFFF3F6FA);
const blue = Color(0xFF0B5FD8);
const sky = Color(0xFF13B9FD);
const line = Color(0xFFD9E1EC);

TextStyle heading(double size, {Color color = ink}) => GoogleFonts.spaceGrotesk(
    fontSize: size, fontWeight: FontWeight.w700, height: 1.15, color: color);

ThemeData buildTheme() => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme.fromSeed(seedColor: blue),
      textTheme:
          GoogleFonts.interTextTheme().apply(bodyColor: ink, displayColor: ink),
    );
