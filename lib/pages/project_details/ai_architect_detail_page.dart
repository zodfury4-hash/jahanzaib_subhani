import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_theme.dart';
import '../../utils/ai_architect_bytes.dart';
import '../../widgets/anim_effects.dart';

class AiArchitectDetailPage extends StatefulWidget {
  const AiArchitectDetailPage({super.key});

  static const String title = 'AI Architect';
  static const String tagline =
      '3D building & floor planning studio with AI layout generation, interactive isometric visualization, and BOQ construction cost estimator.';
  static const String imageUrl = 'assets/images/ai_architect_card_banner.png';
  static const List<String> tags = [
    'Flutter',
    'Provider',
    '3D Floor Planning',
    'AI Layout Generator',
    'Interactive Vector Maps',
    'BOQ Cost Estimator',
    'Multi-Unit Land Support',
  ];

  @override
  State<AiArchitectDetailPage> createState() => _AiArchitectDetailPageState();
}

class _AiArchitectDetailPageState extends State<AiArchitectDetailPage> {
  final _scrollController = ScrollController();

  String get title => AiArchitectDetailPage.title;
  String get tagline => AiArchitectDetailPage.tagline;
  String get imageUrl => AiArchitectDetailPage.imageUrl;
  List<String> get tags => AiArchitectDetailPage.tags;

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
        actions: const [],
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

                    // 3. Project Overview
                    InViewReveal(
                      offset: const Offset(0, 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Project Overview'),
                          const SizedBox(height: 14),
                          _buildInfoCard(
                            'AI Architect is a modern, high-performance architectural studio and 3D house planning application. '
                            'It transforms raw plot dimensions into intelligent, livable architectural floor plans and interactive 3D models before laying a single brick. '
                            'The app supports localized land standards (Marla, Kanal, Square Feet, Square Meters, Square Yards/Gaj) and generates full structural BOQ '
                            'construction cost estimates in PKR with detailed breakdowns of RCC concrete framing, double-glazed UPVC windows, and premium building materials.',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 4. Feature Highlights Grid
                    InViewReveal(
                      offset: const Offset(0, 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Feature Breakdown'),
                          const SizedBox(height: 14),
                          _buildFeatureHighlightsGrid(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 5. Complete Step-by-Step Application Workflow
                    InViewReveal(
                      offset: const Offset(0, 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Step-by-Step Architectural Pipeline'),
                          const SizedBox(height: 14),
                          _buildWorkflowSteps(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 6. Technical Architecture & Tech Stack
                    InViewReveal(
                      offset: const Offset(0, 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Technical Architecture & Stack'),
                          const SizedBox(height: 14),
                          _buildArchitectureGrid(isDesktop),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 7. Core Capabilities
                    InViewReveal(
                      offset: const Offset(0, 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Key Capabilities'),
                          const SizedBox(height: 16),
                          _buildFeatureItem('Interactive 3D Isometric View: 360-degree rotation, section tap zoom, and elevation analysis directly on device.'),
                          _buildFeatureItem('Architectural Floor Plans: Precise 2D CAD-styled layout maps with labeled dimensions for TV lounge, drawing room, and bedrooms.'),
                          _buildFeatureItem('Live BOQ Cost Estimator: Real-time construction budget computation in PKR based on slab area and current material rates.'),
                          _buildFeatureItem('Subcontinental & Global Land Units: Full support for Marla (225 / 250 / 272 sq ft), Kanal, Sq Ft, Sq Meters, Gaj, and Pyeong.'),
                          _buildFeatureItem('Custom Program Specifications: Floor height selection, North/South/East/West road faces, and middle vs corner plot dynamics.'),
                          _buildFeatureItem('AI Design Variations: 6+ modern architectural variations (e.g. Modern Cantilever Box Villa) with one-tap redesign.'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 8. Engineering Highlights
                    InViewReveal(
                      offset: const Offset(0, 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Engineering & Architectural Solutions'),
                          const SizedBox(height: 14),
                          _buildInfoCard(
                            '• Custom Vector Canvas & CAD Rendering: Built high-performance CustomPainter widgets to render floor plans with millimeter-accurate wall polylines, door swing arcs, and dimension markers without lag.\n\n'
                            '• Localized Land Conversion Algorithm: Formulated a precision conversion engine supporting regional subcontinental Marla variations (225 sq ft LDA vs 250 sq ft vs 272.25 sq ft revenue standard) and international metrics.\n\n'
                            '• Dynamic BOQ Cost Calculation Engine: Reactive calculation model linking covered slab area, foundation soil type, floor levels, and material tiers (Standard vs Luxury) into instant line-item estimates in PKR Lakhs.',
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

  Widget _buildFeatureHighlightsGrid() {
    final screens = [
      {
        'screen': '3D ISOMETRIC VISUALIZATION',
        'icon': Icons.view_in_ar_rounded,
        'badge': '360° Drag & Zoom',
        'desc':
            'Interactive 3D building model with clean isometric rendering, floor separation, section inspection, and dynamic camera angles.',
      },
      {
        'screen': 'ARCHITECTURAL FLOOR PLAN',
        'icon': Icons.architecture_rounded,
        'badge': 'Ground Floor & Terrace',
        'desc':
            'Complete CAD-styled 2D blueprint showing precise room dimensions, car porch, lawn, open-to-sky ducting, and stair hall flow.',
      },
      {
        'screen': 'BOQ COST ESTIMATOR',
        'icon': Icons.calculate_rounded,
        'badge': 'Live Budget in PKR',
        'desc':
            'Automated construction cost computation in PKR Lakhs based on covered slab area, floor count, and local contractor market rates.',
      },
      {
        'screen': 'PLOT CONFIGURATION',
        'icon': Icons.straighten_rounded,
        'badge': 'Frontage & Depth Specs',
        'desc':
            'Custom plot dimensional input (e.g. 5 Marla 25x50, 10 Marla 35x71, 1 Kanal) with road facing direction and setback optimization.',
      },
      {
        'screen': 'LAND MEASUREMENT UNITS',
        'icon': Icons.language_rounded,
        'badge': 'Global & Local Standards',
        'desc':
            'Multi-standard conversion engine supporting Marla (Pakistan/India), Kanal, Sq Ft, Sq Meters, Gaj, and Korean Pyeong.',
      },
      {
        'screen': 'AI STRUCTURAL SPECIFICATIONS',
        'icon': Icons.assignment_turned_in_rounded,
        'badge': 'Materials & Standards',
        'desc':
            'Full structural recommendations covering RCC concrete frame, double-glazed UPVC windows, porcelain tiles, and natural ventilation.',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final cols = constraints.maxWidth > 950 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
        final w = (constraints.maxWidth - 16 * (cols - 1)) / cols;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: screens.map((s) {
            return SizedBox(
              width: w,
              child: HoverElevate(
                translateY: -4,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10121A),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: emerald.withValues(alpha: 0.28)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: emerald.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: emeraldAccent.withValues(alpha: 0.45)),
                            ),
                            child: Icon(s['icon'] as IconData, color: emeraldAccent, size: 26),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  s['screen'] as String,
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: emerald.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    s['badge'] as String,
                                    style: const TextStyle(
                                      color: emeraldAccent,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Text(
                        s['desc'] as String,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          color: Color(0xFFC7CBD6),
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

  Widget _buildWorkflowSteps() {
    final steps = [
      {
        'step': '01',
        'title': 'Plot Input & Regional Unit Selection',
        'desc': 'User enters plot dimensions (frontage & depth), selects orientation (North/South), and sets local measurement unit (e.g., 5 Marla 250 sq ft standard).',
      },
      {
        'step': '02',
        'title': 'Custom Program & Room Requirements',
        'desc': 'Configures desired bedrooms, bathrooms, car porch space, ceiling height (10 ft), and architectural style preferences.',
      },
      {
        'step': '03',
        'title': 'AI Floor Blueprint Generation',
        'desc': 'The AI engine generates 6 optimized architectural variations with zoned public/private spaces, ventilation ducts, and setbacks.',
      },
      {
        'step': '04',
        'title': '3D Isometric & Section Exploration',
        'desc': 'Users inspect clean isometric 3D models with 360-degree orbit controls, level-by-level floor slicing, and roof terrace switching.',
      },
      {
        'step': '05',
        'title': 'BOQ Construction Budget & Material Report',
        'desc': 'Instantly calculates estimated construction expenditure in PKR Lakhs alongside recommended materials (RCC frame, UPVC windows, tile specifications).',
      },
    ];

    return Column(
      children: steps.map((s) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: HoverElevate(
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: line),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: emerald.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: emeraldAccent.withValues(alpha: 0.5)),
                    ),
                    child: Center(
                      child: Text(
                        s['step']!,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: emeraldAccent,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          s['title']!,
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          s['desc']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFFC7CBD6),
                            height: 1.45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildArchitectureGrid(bool isDesktop) {
    final arch = [
      {
        'title': 'Presentation & 3D Vectoring',
        'tech': 'Flutter CustomPainter & Canvas',
        'desc': 'Interactive 3D isometric projection matrix, camera orbit gestures, and high-precision CAD wall vector rendering.',
      },
      {
        'title': 'State & Layout Management',
        'tech': 'Provider (ChangeNotifier)',
        'desc': 'Decoupled architectural state coordinating plot unit conversion, floor plan generation algorithms, and active room tags.',
      },
      {
        'title': 'BOQ Calculation Engine',
        'tech': 'Algorithmic Financial Logic',
        'desc': 'Real-time multi-variable formula computing steel, cement, brick, and labor costs mapped against regional market PKR indices.',
      },
      {
        'title': 'Design System',
        'tech': 'SpaceGrotesk & Dark Luxury UI',
        'desc': 'Consistent high-contrast architectural blueprint palette designed for clarity across phone, tablet, and desktop viewports.',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final cols = constraints.maxWidth > 700 ? 2 : 1;
        final w = (constraints.maxWidth - 16 * (cols - 1)) / cols;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: arch.map((a) {
            return SizedBox(
              width: w,
              child: HoverElevate(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: line),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        a['title']!,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: emeraldAccent,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        a['tech']!,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        a['desc']!,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.45,
                          color: Color(0xFFC7CBD6),
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
      {'path': 'assets/images/ai_architect/arch_01_splash_screen.png', 'caption': 'SPLASH SCREEN'},
      {'path': 'assets/images/ai_architect/arch_02_dream_home_design.png', 'caption': 'DESIGN DREAM HOME'},
      {'path': 'assets/images/ai_architect/arch_03_interactive_3d_viz.png', 'caption': '3D VISUALIZATION'},
      {'path': 'assets/images/ai_architect/arch_04_ai_suggestions.png', 'caption': 'AI SUGGESTIONS'},
      {'path': 'assets/images/ai_architect/arch_11_plot_dimensions_input.png', 'caption': 'PLOT DIMENSIONS'},
      {'path': 'assets/images/ai_architect/arch_05_3d_model_isometric.png', 'caption': '3D ISOMETRIC MODEL'},
      {'path': 'assets/images/ai_architect/arch_06_floor_plan_ground.png', 'caption': 'ARCHITECTURAL PLAN'},
      {'path': 'assets/images/ai_architect/arch_07_structural_specs.png', 'caption': 'STRUCTURAL SPECS'},
      {'path': 'assets/images/ai_architect/arch_08_materials_report.png', 'caption': 'RECOMMENDED MATERIALS'},
      {'path': 'assets/images/ai_architect/arch_09_cost_estimator_boq.png', 'caption': 'BOQ COST ESTIMATOR'},
      {'path': 'assets/images/ai_architect/arch_10_plot_measurement_units.png', 'caption': 'MEASUREMENT UNITS'},
    ];

    return SizedBox(
      height: 450,
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
            return _InteractiveArchCard(
              imagePath: item['path']!,
              caption: item['caption']!,
            );
          },
        ),
      ),
    );
  }
}

class _InteractiveArchCard extends StatefulWidget {
  final String imagePath;
  final String caption;

  const _InteractiveArchCard({
    required this.imagePath,
    required this.caption,
  });

  @override
  State<_InteractiveArchCard> createState() => _InteractiveArchCardState();
}

class _InteractiveArchCardState extends State<_InteractiveArchCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bytes = AiArchitectBytes.getBytes(widget.imagePath);

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
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 6),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (bytes != null && bytes.isNotEmpty)
                      Image.memory(
                        bytes,
                        fit: BoxFit.cover,
                        gaplessPlayback: true,
                      )
                    else
                      Image.asset(
                        widget.imagePath,
                        fit: BoxFit.cover,
                        gaplessPlayback: true,
                        errorBuilder: (_, __, ___) => const Center(
                          child: Icon(Icons.broken_image, color: Colors.white24),
                        ),
                      ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 250),
                      opacity: _isHovered ? 0.0 : 0.05,
                      child: Container(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6),
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
