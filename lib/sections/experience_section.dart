import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/anim_effects.dart';
import '../widgets/section_wrapper.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Work Experience',
      child: Column(
        children: [
          for (int i = 0; i < experiences.length; i++)
            InViewReveal(
              delay: Duration(milliseconds: 140 * i),
              offset: const Offset(0, 30),
              child: HoverElevate(
                translateY: -5,
                scale: 1.01,
                glowColor: emeraldAccent,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: line),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final isNarrow = constraints.maxWidth < 600;
                          if (isNarrow) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(fontSize: 18, color: ink),
                                    children: [
                                      TextSpan(
                                        text: experiences[i].company,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '  ( ${experiences[i].role} )',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: muted,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  experiences[i].period,
                                  style: const TextStyle(
                                    color: emeraldAccent,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            );
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(fontSize: 19, color: ink),
                                    children: [
                                      TextSpan(
                                        text: experiences[i].company,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '  ( ${experiences[i].role} )',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: muted,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                experiences[i].period,
                                style: const TextStyle(
                                  color: emeraldAccent,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      for (final p in experiences[i].points)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 7, right: 12),
                                child: Icon(
                                  Icons.circle,
                                  size: 6,
                                  color: emeraldAccent,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  p,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    height: 1.55,
                                    color: Color(0xFFD0D5DD),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
