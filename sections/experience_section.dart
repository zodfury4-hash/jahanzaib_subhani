import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/section_wrapper.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Experience',
      child: Column(children: [
        for (final e in experiences)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: line),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(e.role, style: heading(19)),
              const SizedBox(height: 4),
              Text('${e.company}  |  ${e.period}',
                  style: const TextStyle(color: blue, fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              for (final p in e.points)
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text('•  $p', style: const TextStyle(height: 1.4)),
                ),
            ]),
          ),
      ]),
    );
  }
}
