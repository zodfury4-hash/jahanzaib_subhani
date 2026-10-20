import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data/portfolio_data.dart';
import 'pages/portfolio_splash_page.dart';
import 'theme/app_theme.dart';
import 'utils/anton_font_bytes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    final antonLoader = FontLoader('Anton');
    antonLoader.addFont(Future.value(ByteData.view(antonFontBytes.buffer)));
    antonLoader.load().catchError((_) {});

  } catch (_) {}
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '$myName - $myRole',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: const PortfolioSplashPage(),

    );
  }
}
