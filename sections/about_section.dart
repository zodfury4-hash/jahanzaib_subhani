import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/section_wrapper.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'About me',
      child: Wrap(spacing: 40, runSpacing: 24, children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: const Text(aboutText, style: TextStyle(fontSize: 17, height: 1.6)),
        ),
        Wrap(spacing: 32, runSpacing: 16, children: [
          for (final e in stats.entries)
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(e.value, style: heading(24, color: blue)),
              const SizedBox(height: 4),
              Text(e.key),
            ]),
        ]),
      ]),
    );
  }
}
