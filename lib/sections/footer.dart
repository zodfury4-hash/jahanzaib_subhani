import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
// import 'package:fitness/portfolio/data/portfolio_data.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Text('© ${DateTime.now().year} $myName. Built with Flutter.',
              style: const TextStyle(fontSize: 13)),
        ),
      );
}
