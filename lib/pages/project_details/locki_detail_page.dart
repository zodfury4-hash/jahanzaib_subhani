import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/portfolio_data.dart';
import '../../theme/app_theme.dart';
import '../../utils/helpers.dart';
import '../../widgets/anim_effects.dart';

class LockiDetailPage extends StatefulWidget {
  const LockiDetailPage({super.key});

  static const String title = 'Locki';
  static const String tagline =
      'Real-time GPS location tracking and route navigation application powered by OpenStreetMap, Provider, and Firebase.';
  static const String imageUrl = 'assets/images/locki_showcase.jpg';
  static const List<String> tags = [
    'Flutter',
    'Provider',
    'Firebase',
    'OpenStreetMap',
    'Geolocator',
    'Live Tracking',
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
        actions: [
          IconButton(
            icon: const Icon(Icons.code, color: emeraldAccent),
            tooltip: 'View Source Code',
            onPressed: () => openUrl(github),
          ),
          const SizedBox(width: 12),
        ],
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
                    // 1. Hero Image Banner
                    FadeSlideIn(
                      offset: const Offset(0, 30),
                      child: _buildBanner(isDesktop),
                    ),
                    const SizedBox(height: 32),

                    // 2. Title & Status
                    FadeSlideIn(
                      offset: const Offset(0, 20),
                      delay: const Duration(milliseconds: 150),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: emerald.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: emeraldAccent.withValues(alpha: 0.4)),
                            ),
                            child: const Text(
                              'GEOLOCATION • REAL-TIME MAPPING & ROUTE TRACKING',
                              style: TextStyle(
                                color: emeraldAccent,
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
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
                          Wrap(
                            spacing: 16,
                            runSpacing: 12,
                            children: [
                              FilledButton.icon(
                                style: FilledButton.styleFrom(
                                  backgroundColor: emerald,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                icon: const Icon(Icons.code, size: 20),
                                label: const Text('View Source Code', style: TextStyle(fontWeight: FontWeight.w700)),
                                onPressed: () => openUrl(github),
                              ),
                            ],
                          ),
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
                            'Locki is a high-precision live location tracking and navigation application designed to monitor real-time movement between locations. '
                            'Featuring a streamlined architecture starting from a quick Splash screen directly to the main interactive Home screen, '
                            'Locki leverages OpenStreetMap (OSM) for smooth, open-source cartography without proprietary map API limitations. '
                            'With Provider state management and Firebase real-time data sync, the app renders dynamic route polylines, tracking speed, arrival estimates, and live coordinates between departure and arrival points.',
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

                    // 5. Official UI Showcase Image
                    InViewReveal(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Official UI & Navigation Showcase'),
                          const SizedBox(height: 14),
                          _buildShowcaseImage(),
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
                          _buildSectionHeader('Key Capabilities'),
                          const SizedBox(height: 16),
                          _buildFeatureItem('Streamlined User Journey: Instant Splash initialization ➔ Full-featured interactive Home map screen.'),
                          _buildFeatureItem('One-Place-to-Another Live Tracking: Continuous GPS route calculation and real-time movement polylines.'),
                          _buildFeatureItem('OpenStreetMap (OSM) Integration: Crisp vector map tiles with custom neon location pins and smooth panning.'),
                          _buildFeatureItem('Firebase Real-Time Synchronization: Location coordinates broadcast via Firestore snapshot streams.'),
                          _buildFeatureItem('Provider State Architecture: Dedicated LocationProvider for battery-optimized GPS updates and UI responsiveness.'),
                          _buildFeatureItem('Route Metrics: Dynamic calculation of travel distance, current speed, heading bearing, and estimated arrival time.'),
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

  Widget _buildBanner(bool isDesktop) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: isDesktop ? 440 : 260,
        decoration: BoxDecoration(
          color: const Color(0xFF030712),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: emerald.withValues(alpha: 0.3)),
        ),
        child: Image.asset(
          'assets/images/locki_showcase.jpg',
          fit: isDesktop ? BoxFit.cover : BoxFit.contain,
          errorBuilder: (_, __, ___) => _buildFallbackBanner(),
        ),
      ),
    );
  }

  Widget _buildShowcaseImage() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF030712),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: emerald.withValues(alpha: 0.35)),
        boxShadow: [
          BoxShadow(
            color: emerald.withValues(alpha: 0.12),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        'assets/images/locki_showcase.jpg',
        width: double.infinity,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => _buildFallbackBanner(),
      ),
    );
  }

  Widget _buildFallbackBanner() {
    return Container(
      width: double.infinity,
      height: 280,
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: emerald.withValues(alpha: 0.3)),
      ),
      child: const Center(
        child: Icon(Icons.map_rounded, size: 64, color: emeraldAccent),
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

  Widget _buildScreenFlowGrid(bool isDesktop) {
    final screens = [
      {
        'screen': 'SPLASH SCREEN',
        'icon': Icons.flash_on_rounded,
        'badge': 'Startup & Permission Check',
        'desc':
            'Initial launch screen that checks GPS device hardware status, requests fine/coarse location permissions, '
            'and establishes Firebase backend connectivity before transitioning to the map interface.',
      },
      {
        'screen': 'HOME MAP DASHBOARD',
        'icon': Icons.navigation_rounded,
        'badge': 'OpenStreetMap & Real-Time Tracking',
        'desc':
            'Full-screen OpenStreetMap view featuring current location marker, destination search, '
            'live route polyline drawing between two places, distance counter, speed odometer, and live tracking controls.',
      },
    ];

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: screens.map((s) {
          return Expanded(
            child: HoverElevate(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                padding: const EdgeInsets.all(22),
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
                          child: Icon(s['icon'] as IconData, color: emeraldAccent, size: 28),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                s['screen'] as String,
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 16,
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
                    const SizedBox(height: 16),
                    Text(
                      s['desc'] as String,
                      style: const TextStyle(
                        fontSize: 14.5,
                        height: 1.55,
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
    }

    return Column(
      children: screens.map((s) {
        return HoverElevate(
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFF10121A),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: emerald.withValues(alpha: 0.28)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: emerald.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: emeraldAccent.withValues(alpha: 0.45)),
                  ),
                  child: Icon(s['icon'] as IconData, color: emeraldAccent, size: 28),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            s['screen'] as String,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(width: 10),
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
                      const SizedBox(height: 8),
                      Text(
                        s['desc'] as String,
                        style: const TextStyle(
                          fontSize: 14.5,
                          height: 1.55,
                          color: Color(0xFFC7CBD6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
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
}
