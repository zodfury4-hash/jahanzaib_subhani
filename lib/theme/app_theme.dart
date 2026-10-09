import 'package:flutter/material.dart';

// Dark Luxury Black & Emerald Green Theme
const bg = Color(0xFF060709); // Deep dark background
const cardBg = Color(0xFF0F1117);
const emerald = Color(0xFF0E7A5A); // Design's signature rich green
const emeraldLight = Color(0xFF139D74);
const emeraldAccent = Color(0xFF1FD69E);

const ink = Colors.white;
const muted = Color(0xFF9EA3AE);
const line = Color(0xFF1F232D);
const blue = emerald;
const sky = emeraldLight;

TextStyle heading(double size, {Color color = ink}) => TextStyle(
    fontFamily: 'SpaceGrotesk',
    fontSize: size,
    fontWeight: FontWeight.w900,
    height: 1.15,
    color: color,
);

TextStyle displayBig(double size, {Color color = emerald}) => TextStyle(
    fontFamily: 'Anton',
    fontSize: size,
    letterSpacing: 2,
    height: 0.95,
    color: color,
);

TextStyle signature(double size, {Color color = ink}) => TextStyle(
    fontFamily: 'SpaceGrotesk',
    fontSize: size,
    fontWeight: FontWeight.w700,
    color: color,
);

ThemeData buildTheme() => ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'SpaceGrotesk',
      scaffoldBackgroundColor: bg,
      colorScheme: const ColorScheme.dark(
        primary: emerald,
        surface: cardBg,
        onSurface: ink,
      ),
    );

