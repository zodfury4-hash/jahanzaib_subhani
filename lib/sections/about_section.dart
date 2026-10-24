import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/anim_effects.dart';
import '../widgets/section_wrapper.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'About me',
      child: InViewReveal(
        delay: const Duration(milliseconds: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 820),
              child: const Text(
                aboutText,
                style: TextStyle(
                  fontSize: 16.5,
                  height: 1.7,
                  color: Color(0xFFD6DAE3),
                  letterSpacing: 0.3,
                ),
              ),
            ),
            const SizedBox(height: 28),
            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 650;
                final cardItems = [
                  const _StatItem(
                    value: '6+',
                    label: 'Projects',
                    icon: Icons.rocket_launch_rounded,
                  ),
                  const _StatItem(
                    value: 'Almost 1 yr',
                    label: 'Experience',
                    icon: Icons.workspace_premium_rounded,
                  ),
                  const _StatItem(
                    value: 'Multi-Platform',
                    label: 'Android, iOS, Web',
                    icon: Icons.devices_rounded,
                  ),
                ];

                if (isWide) {
                  return Row(
                    children: [
                      for (int i = 0; i < cardItems.length; i++) ...[
                        if (i > 0) const SizedBox(width: 18),
                        Expanded(
                          child: InViewReveal(
                            delay: Duration(milliseconds: 120 * i),
                            offset: const Offset(0, 25),
                            child: _buildCard(cardItems[i]),
                          ),
                        ),
                      ],
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      for (int i = 0; i < cardItems.length; i++) ...[
                        if (i > 0) const SizedBox(height: 12),
                        InViewReveal(
                          delay: Duration(milliseconds: 120 * i),
                          offset: const Offset(0, 25),
                          child: _buildCard(cardItems[i]),
                        ),
                      ],
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(_StatItem item) {
    return HoverElevate(
      translateY: -4,
      scale: 1.02,
      glowColor: emeraldAccent,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: line),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: emerald.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(item.icon, color: emeraldAccent, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(item.value, style: heading(22, color: emeraldAccent)),
                  const SizedBox(height: 3),
                  Text(
                    item.label,
                    style: const TextStyle(
                      color: muted,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem {
  final String value;
  final String label;
  final IconData icon;
  const _StatItem({required this.value, required this.label, required this.icon});
}
