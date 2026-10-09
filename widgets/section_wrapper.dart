import 'package:flutter/material.dart';
// import 'package:fitness/portfolio/theme/app_theme.dart';

import '../theme/app_theme.dart';

/// Har section ko same width, padding aur title deta hai.
class SectionWrapper extends StatelessWidget {
  final String? title;
  final Widget child;
  const SectionWrapper({super.key, this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (title != null) ...[
              Text(title!, style: heading(28)),
              const SizedBox(height: 22),
            ],
            child,
          ]),
        ),
      ),
    );
  }
}
