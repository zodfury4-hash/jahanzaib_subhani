import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/helpers.dart';
import '../widgets/phone_mock.dart';
import '../widgets/section_wrapper.dart';
class HeroSection extends StatelessWidget {
  final VoidCallback onProjects;
  const HeroSection({super.key, required this.onProjects});

  @override
  Widget build(BuildContext context) {
    final wide = isWide(context);
    final text = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(myRole,
          style: TextStyle(color: blue, fontWeight: FontWeight.w600, fontSize: 16)),
      const SizedBox(height: 12),
      Text('Hi, main $myName hoon.\n$headline', style: heading(wide ? 44 : 30)),
      const SizedBox(height: 20),
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: const Text(myIntro, style: TextStyle(fontSize: 17, height: 1.5)),
      ),
      const SizedBox(height: 28),
      Wrap(spacing: 12, runSpacing: 12, children: [
        FilledButton(
          style: FilledButton.styleFrom(
              backgroundColor: blue,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16)),
          onPressed: onProjects,
          child: const Text('See my projects'),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              foregroundColor: ink,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16)),
          onPressed: () => openUrl(resumeUrl),
          child: const Text('Download resume'),
        ),
      ]),
    ]);

    return SectionWrapper(
      child: wide
          ? Row(children: [
              Expanded(child: text),
              const SizedBox(width: 40),
              const PhoneMock(),
            ])
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              text,
              const SizedBox(height: 40),
              const Center(child: PhoneMock()),
            ]),
    );
  }
}
