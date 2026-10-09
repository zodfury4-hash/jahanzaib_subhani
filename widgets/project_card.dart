import 'package:flutter/material.dart';
import '../models/project.dart';
import '../theme/app_theme.dart';
import '../utils/helpers.dart';

class ProjectCard extends StatelessWidget {
  final Project p;
  const ProjectCard(this.p, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: line),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(p.title, style: heading(20)),
        const SizedBox(height: 10),
        Text(p.desc, style: const TextStyle(height: 1.45)),
        const SizedBox(height: 14),
        Wrap(spacing: 10, runSpacing: 6, children: [
          for (final t in p.tags)
            Text(t,
                style: const TextStyle(
                    color: blue, fontWeight: FontWeight.w600, fontSize: 13)),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          TextButton(
              onPressed: () => openUrl(p.codeLink),
              child: const Text('View code')),
          if (p.liveLink != null)
            TextButton(
                onPressed: () => openUrl(p.liveLink!),
                child: const Text('Live demo')),
        ]),
      ]),
    );
  }
}
