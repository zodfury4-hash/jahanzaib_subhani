import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/project.dart';
import '../theme/app_theme.dart';
import '../widgets/anim_effects.dart';

class ProjectDetailPage extends StatefulWidget {
  final Project project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  final _scrollController = ScrollController();

  Project get project => widget.project;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 800;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => Navigator.of(context).pop(),
          tooltip: 'Back to portfolio',
        ),
        title: Text(
          project.title,
          style: GoogleFonts.spaceGrotesk(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        actions: [],
      ),
      body: Column(
        children: [
          ScrollProgressBar(scrollController: _scrollController),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 48 : 20,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. Project Image Banner
                    FadeSlideIn(
                      offset: const Offset(0, 30),
                      child: _buildProjectImageBanner(context, isDesktop),
                    ),
                    const SizedBox(height: 32),

                    // 2. Title & Tech Badges
                    FadeSlideIn(
                      offset: const Offset(0, 20),
                      delay: const Duration(milliseconds: 150),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.title,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: isDesktop ? 36 : 28,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            project.desc,
                            style: TextStyle(
                              fontSize: isDesktop ? 18 : 16,
                              color: muted,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: project.tags.map((tag) {
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                decoration: BoxDecoration(
                                  color: emerald.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: emeraldAccent.withValues(alpha: 0.4)),
                                ),
                                child: Text(
                                  tag,
                                  style: const TextStyle(
                                    color: emeraldAccent,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 30),
                          ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Divider(color: line, height: 1),
                    const SizedBox(height: 36),

                    // 3. Project Overview / Detail Description
                    InViewReveal(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Project Overview',
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: cardBg,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: line),
                            ),
                            child: Text(
                              project.fullDescription ??
                                  '${project.desc}\n\nThis application is engineered following modern Flutter and Dart architectural best practices. It incorporates clean code principles, robust state management, and fully adaptive, responsive design across Android, iOS, and Web platforms for a seamless 60+ FPS user experience.',
                              style: const TextStyle(
                                fontSize: 16,
                                height: 1.7,
                                color: Color(0xFFD6DAE3),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 4. Key Features
                    if (project.features.isNotEmpty) ...[
                      InViewReveal(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Key Features',
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ...project.features.map((feature) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 4),
                                        padding: const EdgeInsets.all(4),
                                        decoration: const BoxDecoration(
                                          color: emerald,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.check, size: 14, color: Colors.white),
                                      ),
                                      const SizedBox(width: 14),
                                      Expanded(
                                        child: Text(
                                          feature,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            height: 1.5,
                                            color: Color(0xFFD6DAE3),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 36),
                    ],

                    // 5. Back Button at bottom
                    InViewReveal(
                      child: Center(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            foregroundColor: muted,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.arrow_back),
                          label: const Text('Back to All Projects', style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectImageBanner(BuildContext context, bool isDesktop) {
    if (project.imageUrl != null && project.imageUrl!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          height: isDesktop ? 440 : 260,
          color: cardBg,
          child: project.imageUrl!.startsWith('assets/')
              ? Image.asset(
                  project.imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => _buildFallbackBanner(),
                )
              : Image.network(
                  project.imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => _buildFallbackBanner(),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: cardBg,
                      child: const Center(
                        child: CircularProgressIndicator(color: emeraldAccent),
                      ),
                    );
                  },
                ),
        ),
      );
    }
    return _buildFallbackBanner();
  }

  Widget _buildFallbackBanner() {
    return Container(
      width: double.infinity,
      height: 280,
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: emerald.withValues(alpha: 0.3)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF0F1117),
            emerald.withValues(alpha: 0.25),
            const Color(0xFF060709),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: emerald.withValues(alpha: 0.2),
                shape: BoxShape.circle,
                border: Border.all(color: emeraldAccent.withValues(alpha: 0.5)),
              ),
              child: const Icon(Icons.flutter_dash, size: 64, color: emeraldAccent),
            ),
            const SizedBox(height: 16),
            Text(
              project.title,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Flutter Mobile & Cross-Platform App',
              style: TextStyle(color: muted, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
