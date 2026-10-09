import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/section_wrapper.dart';
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Skills',
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        for (final g in skillGroups.entries) ...[
          Text(g.key, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Wrap(spacing: 10, runSpacing: 10, children: [
            for (final s in g.value)
              Chip(
                label: Text(s),
                backgroundColor: Colors.white,
                side: const BorderSide(color: line),
              ),
          ]),
          const SizedBox(height: 20),
        ],
      ]),
    );
  }
}
