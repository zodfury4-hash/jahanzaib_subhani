import 'dart:ui';
import 'package:flutter/material.dart';

/// Custom ScrollBehavior that enables drag scrolling with mouse, touch, trackpad, and stylus
/// across all platforms (Web, Windows, macOS, Linux, Mobile).
class AppScrollBehavior extends MaterialScrollBehavior {
  const AppScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}
