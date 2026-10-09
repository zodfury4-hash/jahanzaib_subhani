import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../widgets/project_card.dart';
import '../widgets/section_wrapper.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Projects',
      child: LayoutBuilder(builder: (context, c) {
        final cols = c.maxWidth > 800 ? 3 : (c.maxWidth > 520 ? 2 : 1);
        final w = (c.maxWidth - 20 * (cols - 1)) / cols;
        return Wrap(spacing: 20, runSpacing: 20, children: [
          for (final p in projects) SizedBox(width: w, child: ProjectCard(p)),
        ]);
      }),
    );
  }
}
