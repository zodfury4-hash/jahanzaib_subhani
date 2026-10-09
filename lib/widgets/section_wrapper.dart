import 'package:flutter/material.dart';
// import 'package:fitness/portfolio/theme/app_theme.dart';

import '../theme/app_theme.dart';
import 'anim_effects.dart';

/// Har section ko same width, padding aur title deta hai.
class SectionWrapper extends StatelessWidget {
  final String? title;
  final Widget child;
  const SectionWrapper({super.key, this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 1100),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (title != null) ...[
              InViewReveal(
                offset: const Offset(-24, 0),
                delay: const Duration(milliseconds: 50),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 4,
                      height: 28,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [emeraldAccent, emerald],
                        ),
                        borderRadius: BorderRadius.circular(3),
                        boxShadow: [
                          BoxShadow(
                            color: emeraldAccent.withValues(alpha: 0.5),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 14),
                    Text(title!, style: heading(28)),
                  ],
                ),
              ),
              const SizedBox(height: 26),
            ],
            child,
          ]),
        ),
    );
  }
}
