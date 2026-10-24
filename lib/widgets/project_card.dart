import '../utils/ai_notezilla_bytes.dart';
import '../utils/matrix_pos_bytes.dart';
import '../utils/ai_architect_bytes.dart';
import '../utils/stitch_bytes.dart';
import '../utils/chatflow_bytes.dart';
import '../utils/locki_bytes.dart';
import '../utils/expense_tracker_bytes.dart';
import 'package:flutter/material.dart';

import '../models/project.dart';
import '../pages/project_details/project_details.dart';
import '../theme/app_theme.dart';
import '../utils/helpers.dart';

class ProjectCard extends StatefulWidget {
  final Project p;
  const ProjectCard(this.p, {super.key});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  void _openDetails() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => getProjectDetailPage(widget.p),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.p;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _openDetails,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0, _isHovered ? -7 : 0, 0)
            ..multiply(Matrix4.diagonal3Values(
                _isHovered ? 1.02 : 1.0, _isHovered ? 1.02 : 1.0, 1.0)),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered ? emeraldAccent : line,
              width: _isHovered ? 1.6 : 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? emeraldAccent.withValues(alpha: 0.22)
                    : Colors.transparent,
                blurRadius: _isHovered ? 24.0 : 0.0,
                offset: _isHovered ? const Offset(0, 8) : Offset.zero,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14.5),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Image Preview (if provided)
              if (p.imageUrl != null && p.imageUrl!.isNotEmpty)
                SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Builder(
                    builder: (context) {
                      if (p.imageUrl!.contains('ai_architect')) {
                        final bytes = AiArchitectBytes.getBytes('assets/images/ai_architect_card_banner.png');
                        if (bytes != null && bytes.isNotEmpty) {
                          return Image.memory(
                            bytes,
                            fit: BoxFit.cover,
                            gaplessPlayback: true,
                          );
                        }
                      }
                      if (p.imageUrl!.contains('expense_tracker')) {
                        final bytes = expenseTrackerScreensBytes['screen_1.png'] ?? expenseTrackerScreensBytes['screen_2.png'];
                        if (bytes != null && bytes.isNotEmpty) {
                          return Image.memory(
                            bytes,
                            fit: BoxFit.cover,
                            gaplessPlayback: true,
                          );
                        }
                      }
                      if (p.imageUrl!.contains('stitch')) {
                        final bytes = StitchBytes.getBytes('assets/images/stitch_card_banner.png') ?? StitchBytes.getBytes('assets/images/stitch_logo.png');
                        if (bytes != null && bytes.isNotEmpty) {
                          return Image.memory(
                            bytes,
                            fit: BoxFit.cover,
                            gaplessPlayback: true,
                          );
                        }
                      }
                      if (p.imageUrl!.contains('chatflow')) {
                        final bytes = ChatflowBytes.getBytes('assets/images/chatflow_card_banner.png') ?? ChatflowBytes.getBytes('assets/images/chatflow_logo.png');
                        if (bytes != null && bytes.isNotEmpty) {
                          return Image.memory(
                            bytes,
                            fit: BoxFit.cover,
                            gaplessPlayback: true,
                          );
                        }
                      }
                      if (p.imageUrl!.contains('locki')) {
                        final bytes = lockiScreensBytes['locki_card_banner.png'] ?? lockiScreensBytes['locki_logo.png'];
                        if (bytes != null && bytes.isNotEmpty) {
                          return Image.memory(
                            bytes,
                            fit: BoxFit.cover,
                            gaplessPlayback: true,
                          );
                        }
                      }
                      if (p.imageUrl!.contains('matrix') || p.title.contains('Matrix')) {
                        final bytes = MatrixPosBytes.getBytes('assets/images/matrix_pos_card_banner.png') ?? MatrixPosBytes.getBytes('assets/images/matrix_pos_logo.png');
                        if (bytes != null && bytes.isNotEmpty) {
                          return Image.memory(
                            bytes,
                            fit: BoxFit.cover,
                            gaplessPlayback: true,
                          );
                        }
                      }
                      if (p.imageUrl!.contains('notezilla') || p.title.toLowerCase().contains('notezilla')) {
                        final bytes = AiNoteZillaBytes.getBytes('assets/images/ai_notezilla_card_banner.png') ?? AiNoteZillaBytes.getBytes('assets/images/ai_notezilla_logo.png');
                        if (bytes != null && bytes.isNotEmpty) {
                          return Image.memory(
                            bytes,
                            fit: BoxFit.cover,
                            gaplessPlayback: true,
                          );
                        }
                      }
                      if (p.imageUrl!.startsWith('assets/')) {
                        return Image.asset(
                          p.imageUrl!,
                          fit: BoxFit.cover,
                          gaplessPlayback: true,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: const Color(0xFF141720),
                            child: const Center(
                              child: Icon(Icons.flutter_dash, size: 40, color: emeraldAccent),
                            ),
                          ),
                        );
                      }
                      return Image.network(
                        p.imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: const Color(0xFF141720),
                          child: const Center(
                            child: Icon(Icons.flutter_dash, size: 40, color: emeraldAccent),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            p.title,
                            style: heading(20, color: _isHovered ? emeraldAccent : ink),
                          ),
                        ),
                        AnimatedRotation(
                          turns: _isHovered ? 0.04 : 0.0,
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            Icons.arrow_outward,
                            size: 20,
                            color: _isHovered ? emeraldAccent : muted,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      p.desc,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(height: 1.45, color: Color(0xFFC7CBD6)),
                    ),
                    const SizedBox(height: 16),

                    // Tags
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        for (final t in p.tags)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: emerald.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              t,
                              style: const TextStyle(
                                color: emeraldAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Actions Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            foregroundColor: emeraldAccent,
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: _openDetails,
                          icon: const Text('View Details',
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                          label: const Icon(Icons.arrow_forward, size: 14),
                        ),
                        if (p.liveLink != null)
                          IconButton(
                            icon: const Icon(Icons.launch, size: 20),
                            color: muted,
                            tooltip: 'Live demo',
                            onPressed: () => openUrl(p.liveLink!),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}
