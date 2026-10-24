import 'dart:ui';
import '../../utils/expense_tracker_bytes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_theme.dart';
import '../../widgets/anim_effects.dart';

class AiExpenseTrackerDetailPage extends StatefulWidget {
  const AiExpenseTrackerDetailPage({super.key});

  static const String title = 'Ai Expense Tracker';
  static const String tagline =
      'AI-powered financial expense manager with receipt scanning & automated budget analytics.';
  static const String imageUrl =
      'https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?auto=format&fit=crop&w=1200&q=80';
  static const List<String> tags = ['Flutter', 'Google MlKit', 'Local Storage', 'Charts', 'Provider'];

  @override
  State<AiExpenseTrackerDetailPage> createState() => _AiExpenseTrackerDetailPageState();
}

class _AiExpenseTrackerDetailPageState extends State<AiExpenseTrackerDetailPage> {
  final _scrollController = ScrollController();

  String get title => AiExpenseTrackerDetailPage.title;
  String get tagline => AiExpenseTrackerDetailPage.tagline;
  String get imageUrl => AiExpenseTrackerDetailPage.imageUrl;
  List<String> get tags => AiExpenseTrackerDetailPage.tags;

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
          title,
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
                    // 1. Title & Status (Top Header)
                    FadeSlideIn(
                      offset: const Offset(0, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Text(
                            title,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: isDesktop ? 36 : 28,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            tagline,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFFC7CBD6),
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: tags.map((tag) {
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
                          const SizedBox(height: 24),
                          ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 2. App Showcase & Screens (Interactive Row)
                    FadeSlideIn(
                      offset: const Offset(0, 30),
                      delay: const Duration(milliseconds: 150),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('App Showcase & Screens'),
                          const SizedBox(height: 14),
                          _buildScreenshotsRow(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),
                    const Divider(color: line, height: 1),
                    const SizedBox(height: 36),



                    // 3. Overview
                    InViewReveal(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Project Overview'),
                          const SizedBox(height: 14),
                          _buildInfoCard(
                            'Ai Expense Tracker is an intelligent personal finance platform that eliminates manual transaction entry using on-device optical character recognition (Google MLKit OCR).\n\n'
                            'Users capture photos of paper receipts or digital invoices, and the on-device text recognition engine automatically parses merchants, dates, and itemized totals. '
                            'Coupled with automated category classification, interactive FL Chart visualizations, and an offline-first storage model, all personal financial data remains private, secure, and instant.',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 4. Architecture & Technical Highlights
                    InViewReveal(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Technical Architecture'),
                          const SizedBox(height: 14),
                          _buildArchitectureGrid(isDesktop),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 5. Key Features
                    InViewReveal(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Key Features'),
                          const SizedBox(height: 16),
                          _buildFeatureItem('Google MLKit Optical Character Recognition (OCR) for automatic paper & digital receipt scanning.'),
                          _buildFeatureItem('Intelligent expense categorization (Food, Travel, Utilities, Shopping, Entertainment).'),
                          _buildFeatureItem('Interactive FL Chart analytics featuring monthly breakdown, category donut charts, and spending trend curves.'),
                          _buildFeatureItem('100% Offline-First architecture powered by SQLite / Hive local storage without mandatory cloud dependency.'),
                          _buildFeatureItem('Monthly budget goal setting with real-time threshold alert notifications when approaching budget limits.'),
                          _buildFeatureItem('Multi-currency conversion support and one-tap CSV / PDF financial statement export.'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 6. Challenges & Solutions
                    InViewReveal(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Engineering Challenges Solved'),
                          const SizedBox(height: 14),
                          _buildInfoCard(
                            '• OCR Accuracy on Crumpled Receipts: Folded or low-light receipts often cause text recognition inaccuracies. Implemented advanced image pre-processing filters (grayscale conversion + contrast enhancement), boosting OCR accuracy above 94%.\n\n'
                            '• Smooth Chart Rendering: Large transaction histories previously caused stutter during chart animations. Applied Provider state caching and asynchronous batching to ensure a butter-smooth 60+ FPS user experience.',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Back Button
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

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.spaceGrotesk(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }

  Widget _buildInfoCard(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: line),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15.5,
          height: 1.65,
          color: Color(0xFFD6DAE3),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
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
              text,
              style: const TextStyle(
                fontSize: 15.5,
                height: 1.5,
                color: Color(0xFFD6DAE3),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArchitectureGrid(bool isDesktop) {
    final items = [
      {'title': 'State Management', 'desc': 'Provider pattern with reactive ChangeNotifier listeners'},
      {'title': 'Machine Learning', 'desc': 'Google MLKit On-Device Text Recognition v2'},
      {'title': 'Data Storage', 'desc': 'Encrypted SQLite & Hive offline-first key-value box'},
      {'title': 'Visualization', 'desc': 'FL Chart with custom Bezier curves and animated bars'},
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final double itemWidth = isDesktop
            ? (constraints.maxWidth - 16) / 2
            : double.infinity;
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: items.map((item) {
            return SizedBox(
              width: itemWidth,
              child: HoverElevate(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10121A),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: emerald.withValues(alpha: 0.25)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(
                          color: emeraldAccent,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item['desc']!,
                        style: const TextStyle(
                          color: Color(0xFFC7CBD6),
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildScreenshotsRow() {
    final screens = [
      {'path': 'assets/images/expense_tracker/screen_1.png', 'caption': 'BRAND LOGO'},
      {'path': 'assets/images/expense_tracker/screen_2.png', 'caption': 'SPLASH SCREEN'},
      {'path': 'assets/images/expense_tracker/screen_3.png', 'caption': 'CURRENCY SETUP'},
      {'path': 'assets/images/expense_tracker/screen_4.png', 'caption': 'CATEGORIES'},
      {'path': 'assets/images/expense_tracker/screen_5.png', 'caption': 'ADD ACCOUNT'},
      {'path': 'assets/images/expense_tracker/screen_6.png', 'caption': 'DASHBOARD'},
      {'path': 'assets/images/expense_tracker/screen_10.png', 'caption': 'MONTHLY BUDGET'},
      {'path': 'assets/images/expense_tracker/screen_11.png', 'caption': 'RECORD EXPENSE'},
      {'path': 'assets/images/expense_tracker/screen_13.png', 'caption': 'AI OCR SCANNER'},
      {'path': 'assets/images/expense_tracker/screen_12.png', 'caption': 'IMPORT STATEMENT'},
      {'path': 'assets/images/expense_tracker/screen_7.png', 'caption': 'ASSETS & LIABILITIES'},
      {'path': 'assets/images/expense_tracker/screen_9.png', 'caption': 'TRANSACTIONS'},
      {'path': 'assets/images/expense_tracker/screen_14.png', 'caption': 'SETTINGS'},
    ];

    return SizedBox(
      height: 470,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.trackpad,
            PointerDeviceKind.stylus,
          },
        ),
        child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 4),
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        itemCount: screens.length,
        separatorBuilder: (_, __) => const SizedBox(width: 22),
        itemBuilder: (context, index) {
          final item = screens[index];
          return _InteractiveAppCard(
            imagePath: item['path']!,
            caption: item['caption']!,
          );
        },
        ),
      ),
    );
  }
}

class _InteractiveAppCard extends StatefulWidget {
  final String imagePath;
  final String caption;

  const _InteractiveAppCard({
    required this.imagePath,
    required this.caption,
  });

  @override
  State<_InteractiveAppCard> createState() => _InteractiveAppCardState();
}

class _InteractiveAppCardState extends State<_InteractiveAppCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _isHovered ? -16 : 0, 0),
        width: 205,
        decoration: BoxDecoration(
          color: const Color(0xFF141721),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: _isHovered ? emeraldAccent : const Color(0xFF262C3D),
            width: _isHovered ? 2.0 : 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? emerald.withValues(alpha: 0.35)
                  : Colors.black.withValues(alpha: 0.45),
              blurRadius: _isHovered ? 26 : 14,
              offset: Offset(0, _isHovered ? 14 : 7),
              spreadRadius: _isHovered ? 2 : 0,
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Builder(
                      builder: (context) {
                        final filename = widget.imagePath.split('/').last;
                        final bytes = expenseTrackerScreensBytes[filename];
                        if (bytes != null && bytes.isNotEmpty) {
                          return Image.memory(
                            bytes,
                            fit: BoxFit.cover,
                            gaplessPlayback: true,
                          );
                        }
                        return Image.asset(
                          widget.imagePath,
                          fit: BoxFit.cover,
                          gaplessPlayback: true,
                        );
                      },
                    ),
                    // Subtle overlay gradient on hover
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 250),
                      opacity: _isHovered ? 0.0 : 0.05,
                      child: Container(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 250),
              style: TextStyle(
                fontFamily: 'SpaceGrotesk',
                color: _isHovered ? emeraldAccent : const Color(0xFF8B92A5),
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
              ),
              child: Text(widget.caption),
            ),
          ],
        ),
      ),
    );
  }
}
