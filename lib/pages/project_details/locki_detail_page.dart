import 'dart:ui';
import '../../utils/locki_bytes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_theme.dart';
import '../../widgets/anim_effects.dart';

class LockiDetailPage extends StatefulWidget {
  const LockiDetailPage({super.key});

  static const String title = 'Locki';
  static const String tagline =
      'Real-time GPS location tracking and route navigation application powered by OpenStreetMap, Provider, and Firebase.';
  static const String imageUrl = 'assets/images/locki_showcase.jpg';
  static const List<String> tags = [
    'Flutter',
    'Google Maps API',
    'Offline Maps',
    'Live GPS Tracking',
    'AI Travel Planner',
    'Itinerary Manager',
  ];

  @override
  State<LockiDetailPage> createState() => _LockiDetailPageState();
}

class _LockiDetailPageState extends State<LockiDetailPage> {
  final _scrollController = ScrollController();

  String get title => LockiDetailPage.title;
  String get tagline => LockiDetailPage.tagline;
  String get imageUrl => LockiDetailPage.imageUrl;
  List<String> get tags => LockiDetailPage.tags;

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
                          const SizedBox(height: 28),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Project Overview'),
                          const SizedBox(height: 14),
                          _buildInfoCard(
                            'Locki is an advanced real-time navigation and intelligent trip tracking mobile application engineered with Flutter. '
                            'Powered by high-precision Google Maps API and comprehensive offline map caching, Locki enables travelers to explore destinations, navigate live turn-by-turn routes, and organize multi-day itineraries even without cellular connectivity.\n\n'
                            'From live GPS route calculation and offline region downloads to dedicated AI Travel Planning and collaborative trip management, Locki offers an all-in-one companion for road trips, city tours, and outdoor navigation.',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 4. Screen Architecture (Splash ➔ Home)
                    InViewReveal(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Screen Flow & Navigation'),
                          const SizedBox(height: 14),
                          _buildScreenFlowGrid(isDesktop),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),



                    // 6. Complete Step-by-Step Workflow
                    InViewReveal(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Point-to-Point Tracking Pipeline'),
                          const SizedBox(height: 14),
                          _buildWorkflowSteps(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 7. Technical Architecture & Tech Stack
                    InViewReveal(
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

                    // 8. Core Capabilities
                    InViewReveal(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Key Capabilities & Features'),
                          const SizedBox(height: 16),
                          _buildFeatureItem('Google Maps API Integration: High-accuracy live vector cartography, place autocomplete search, and turn-by-turn routing.'),
                          _buildFeatureItem('Offline Map Download & Caching: Download regional map tiles and saved bookmarks for 100% offline navigation without internet.'),
                          _buildFeatureItem('Real-Time Trip & GPS Route Tracking: Live speed odometer, distance counter, polyline paths, and heading bearings.'),
                          _buildFeatureItem('AI Travel Planner Chat: Conversational itinerary generator tailoring recommendations based on dates, budget, and travel companions.'),
                          _buildFeatureItem('Multi-Day Itinerary Management: Day-by-day scheduling with attraction selection, notes, bookings, and trip budget tracking.'),
                          _buildFeatureItem('Saved Places & Bookmarks: Instant offline bookmarking for hotels, home, work, and favorite landmarks with category tags.'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 9. Engineering Highlights
                    InViewReveal(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Engineering & Architectural Solutions'),
                          const SizedBox(height: 14),
                          _buildInfoCard(
                            '• Battery-Optimized Geolocation Streams: Continuous GPS tracking can rapidly drain device batteries. Implemented dynamic distance filters (5-10 meters) with Geolocator and Provider throttling so location coordinates update smoothly while preserving battery efficiency.\n\n'
                            '• OpenStreetMap Smooth Polyline Rendering: OpenStreetMap tile caching was coupled with Flutter CustomPainter polylines, ensuring that multi-point route paths animate at 60 FPS as the user moves from their starting point to the destination.\n\n'
                            '• Real-Time Firestore Coordinate Broadcast: Location packets (latitude, longitude, speed, timestamp) are piped through Firestore streams so connected devices or supervisors can monitor the route in real time.',
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
      ),)
        ]
    )
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

  Widget _buildScreenFlowGrid(bool isDesktop) {
    final screens = [
      {
        'screen': 'EXPLORE & LIVE MAP',
        'icon': Icons.explore_rounded,
        'badge': 'Google Maps API Engine',
        'desc':
            'Interactive vector mapping dashboard with real-time location indicator, category chips (Food, Fuel, Hospitals), and smooth pinch-to-zoom camera controls.',
      },
      {
        'screen': 'OFFLINE MAP DOWNLOAD',
        'icon': Icons.cloud_download_rounded,
        'badge': 'Offline Storage & Cache',
        'desc':
            'Download and cache high-resolution map tiles directly to local storage (SQLite / Hive). Navigate seamlessly in remote areas with 0% cellular data usage.',
      },
      {
        'screen': 'TRIP & GPS TRACKING',
        'icon': Icons.navigation_rounded,
        'badge': 'Live Route & Odometer',
        'desc':
            'Real-time point-to-point GPS navigation with dynamic road polylines, digital speed odometer, accurate ETA calculation, and turn-by-turn guidance.',
      },
      {
        'screen': 'AI TRAVEL PLANNER',
        'icon': Icons.smart_toy_rounded,
        'badge': 'Automated Itineraries',
        'desc':
            'Conversational AI travel assistant that crafts customized multi-day travel plans, suggests must-visit attractions, and adapts to user budget and companions.',
      },
      {
        'screen': 'SAVED PLACES & PINS',
        'icon': Icons.bookmark_added_rounded,
        'badge': 'Bookmarks & Favorites',
        'desc':
            'Save personal destinations, hotels, and landmarks into custom collections (Home, Work, Landmark, Vacation) with one-tap offline retrieval.',
      },
      {
        'screen': 'SETTINGS & PRIVACY',
        'icon': Icons.tune_rounded,
        'badge': 'Preferences & Storage',
        'desc':
            'Personalized controls for Dark/Light mode theme switching, offline storage management (clear/manage map cache), unit preferences, and push alerts.',
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
                                    letterSpacing: 0.4,
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
                                      fontSize: 10.5,
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
        'title': 'Permission Handshake & Current Fix',
        'desc': 'App launches on Splash screen, validates location service availability, and acquires the user’s exact GPS coordinates.',
      },
      {
        'step': '02',
        'title': 'Destination Selection',
        'desc': 'On the Home screen OpenStreetMap interface, user selects or searches for destination point B.',
      },
      {
        'step': '03',
        'title': 'Point-to-Point Route Generation',
        'desc': 'The app computes the optimal transit route and renders an illuminated polyline connecting place A to place B.',
      },
      {
        'step': '04',
        'title': 'Live Movement Tracking & Sync',
        'desc': 'As the user travels, Provider listens to real-time GPS streams, moves the map camera dynamically, and updates coordinates to Firebase.',
      },
      {
        'step': '05',
        'title': 'Arrival Notification & Trip Summary',
        'desc': 'Upon reaching destination B, the app concludes tracking with a trip summary card showing total distance covered and duration.',
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
                        style: const TextStyle(
                          color: emeraldAccent,
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
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
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15.5,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          s['desc']!,
                          style: const TextStyle(
                            color: Color(0xFFC7CBD6),
                            fontSize: 14,
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
    final items = [
      {'title': 'State Management (Provider)', 'desc': 'LocationProvider and RouteProvider maintaining reactive GPS state and map viewport updates.'},
      {'title': 'OpenStreetMap (OSM)', 'desc': 'flutter_map vector and raster tile caching providing open-source, cost-free mapping capabilities.'},
      {'title': 'Firebase Real-Time Backend', 'desc': 'Cloud Firestore coordinate stream syncing for live shared journey monitoring.'},
      {'title': 'Geolocator GPS Engine', 'desc': 'Hardware-accelerated location positioning with battery-optimized distance filtering.'},
      {'title': 'Dynamic Polyline Routing', 'desc': 'Real-time transit geometry computation connecting departure origin to arrival destination.'},
      {'title': 'Offline Tile Caching', 'desc': 'Local storage caching for rendered map tiles during low-connectivity travel zones.'},
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final cols = constraints.maxWidth > 950 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
        final w = (constraints.maxWidth - 16 * (cols - 1)) / cols;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: items.map((item) {
            return SizedBox(
              width: w,
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
      {'path': 'assets/images/locki/locki_logo.png', 'caption': 'BRAND LOGO'},
      {'path': 'assets/images/locki/locki_1.png', 'caption': 'SPLASH SCREEN'},
      {'path': 'assets/images/locki/locki_2.png', 'caption': 'EXPLORE MAP'},
      {'path': 'assets/images/locki/locki_3.png', 'caption': 'SETTINGS & THEME'},
      {'path': 'assets/images/locki/locki_4.png', 'caption': 'SAVED PLACES'},
      {'path': 'assets/images/locki/locki_5.png', 'caption': 'SAVE NEW PLACE'},
      {'path': 'assets/images/locki/locki_6.png', 'caption': 'MY TRIPS'},
      {'path': 'assets/images/locki/locki_7.png', 'caption': 'AI TRAVEL PLANNER'},
      {'path': 'assets/images/locki/locki_8.png', 'caption': 'DESTINATION SELECTOR'},
      {'path': 'assets/images/locki/locki_9.png', 'caption': 'SELECTED DESTINATION'},
      {'path': 'assets/images/locki/locki_10.png', 'caption': 'DATE PICKER CALENDAR'},
      {'path': 'assets/images/locki/locki_11.png', 'caption': 'INVITE TRIPMATES'},
      {'path': 'assets/images/locki/locki_12.png', 'caption': 'TRIP PREFERENCES'},
      {'path': 'assets/images/locki/locki_13.png', 'caption': 'PICK ATTRACTIONS'},
      {'path': 'assets/images/locki/locki_14.png', 'caption': 'TRIP DETAILS & COVER'},
      {'path': 'assets/images/locki/locki_15.png', 'caption': 'DAILY ITINERARY'},
      {'path': 'assets/images/locki/locki_16.png', 'caption': 'TRIP BUDGET & EXPENSE'},
      {'path': 'assets/images/locki/locki_17.png', 'caption': 'ROUTE MAP OVERVIEW'},
      {'path': 'assets/images/locki/locki_18.png', 'caption': 'TRIPMATES & BOOKINGS'},
      {'path': 'assets/images/locki/locki_19.png', 'caption': 'LIVE GPS NAVIGATION'},
    ];

    return SizedBox(
      height: 500,
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
          return _InteractiveLockiCard(
            imagePath: item['path']!,
            caption: item['caption']!,
          );
        },
        ),
      ),
    );
  }
}

class _InteractiveLockiCard extends StatefulWidget {
  final String imagePath;
  final String caption;

  const _InteractiveLockiCard({
    required this.imagePath,
    required this.caption,
  });

  @override
  State<_InteractiveLockiCard> createState() => _InteractiveLockiCardState();
}

class _InteractiveLockiCardState extends State<_InteractiveLockiCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final filename = widget.imagePath.split('/').last;
    final bytes = lockiScreensBytes[filename];

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _isHovered ? -16 : 0, 0),
        width: 220,
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
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      widget.imagePath,
                      fit: BoxFit.fill,
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
