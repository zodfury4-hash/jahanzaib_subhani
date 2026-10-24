import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_theme.dart';
import '../../utils/stitch_bytes.dart';
import '../../widgets/anim_effects.dart';

class StitchAndWitchDetailPage extends StatefulWidget {
  const StitchAndWitchDetailPage({super.key});

  static const String title = 'Stitch & Witch';
  static const String tagline =
      'Bespoke tailoring & fashion platform connecting Tailors, Clients, and Admins with live order tracking & Cloudinary catalog.';
  static const String imageUrl = 'assets/images/stitch_logo.png';
  static const List<String> tags = [
    'Flutter',
    'Provider',
    'Firebase Firestore',
    'Cloudinary CDN',
    'FCM Notifications',
    'Role-Based Portals',
  ];

  @override
  State<StitchAndWitchDetailPage> createState() => _StitchAndWitchDetailPageState();
}

class _StitchAndWitchDetailPageState extends State<StitchAndWitchDetailPage> {
  final _scrollController = ScrollController();

  String get title => StitchAndWitchDetailPage.title;
  String get tagline => StitchAndWitchDetailPage.tagline;
  String get imageUrl => StitchAndWitchDetailPage.imageUrl;
  List<String> get tags => StitchAndWitchDetailPage.tags;

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
                      offset: const Offset(0, 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Project Overview'),
                          const SizedBox(height: 14),
                          _buildInfoCard(
                            'Stitch & Witch is a comprehensive digital tailoring and bespoke fashion ecosystem designed to bridge the gap between discerning clients, expert master artisans, and platform administrators. '
                            'The platform delivers 3 dedicated role portals: Clients browse masterfully tailored collections across multiple categories (Shirts, Pants, Coats, Hoodies), submit custom body measurements, choose payment methods, and track their order progress in real-time. '
                            'Tailors receive instant order requests, upload high-resolution portfolio items to Cloudinary CDN, manage active workloads, and undergo admin license verification.',
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
                          _buildSectionHeader('Step-by-Step Tailoring Pipeline'),
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
                          _buildFeatureItem('Triple-Role Portal Architecture: Seamlessly separated workflows for Clients, Tailors, and Admin authority.'),
                          _buildFeatureItem('Cloudinary CDN Image Optimization: Automatic compression and delivery of tailor catalog uploads with instant previews.'),
                          _buildFeatureItem('Multi-Method Secure Checkout: Integrated with Credit/Debit cards, EasyPaisa, JazzCash, Direct Bank Transfer, and Cash on Delivery.'),
                          _buildFeatureItem('Live Interactive Order Tracking: Real-time status milestones from "Order Placed" ➔ "Fabric Cutting" ➔ "Stitching" ➔ "Doorstep Delivery".'),
                          _buildFeatureItem('Admin Verification & License Gate: Tailors submit professional credentials that require administrative audit and approval before publishing.'),
                          _buildFeatureItem('Push Notifications (FCM): Instant order acceptance alerts, status updates, and custom offer broadcasts.'),
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
                            '• Multi-Tenant Role Isolation: Custom claims and role-based security rules in Firebase ensure tailors cannot access client measurement vaults, and clients cannot modify tailor catalog listings.\n\n'
                            '• Cloudinary Direct API Uploads: Configured unsigned and signed upload presets for fast mobile media ingestion without placing load on Firebase storage.\n\n'
                            '• Reactive Stream-Driven Order Tracking: Provider listening directly to Firestore snapshot listeners to animate order progress bars without requiring screen reloads.',
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
        'screen': 'BESPOKE CRAFTSMANSHIP',
        'icon': Icons.content_cut_rounded,
        'badge': 'Handcrafted Fashion',
        'desc':
            'Dedicated client discovery flow showcasing hand-stitched garments, expert tailoring craftsmanship, and customizable style options.',
      },
      {
        'screen': 'CLIENT & TAILOR LOGIN',
        'icon': Icons.badge_rounded,
        'badge': 'Dual Role Authentication',
        'desc':
            'Clean tabbed authorization interface enabling instant switching between Client login and Tailor license verification portal.',
      },
      {
        'screen': 'CATEGORY CATALOG',
        'icon': Icons.grid_view_rounded,
        'badge': '9 Collections & Search',
        'desc':
            'Intuitive browsing interface organized by fashion categories (Shirts, Pants, Coats, Outerwear) with live keyword search and filtering.',
      },
      {
        'screen': 'SECURE CHECKOUT',
        'icon': Icons.payment_rounded,
        'badge': '5 Payment Methods',
        'desc':
            'Comprehensive checkout supporting Credit/Debit Cards, EasyPaisa, JazzCash, Direct Bank Transfer, and Cash on Delivery / Fitting.',
      },
      {
        'screen': 'TAILOR ORDER WORKLOAD',
        'icon': Icons.assignment_rounded,
        'badge': 'Real-Time Pipeline',
        'desc':
            'Centralized tailor workbench with new order review requests, workload status updates, and customer measurement specifications.',
      },
      {
        'screen': 'PORTFOLIO & ITEM UPLOAD',
        'icon': Icons.cloud_upload_rounded,
        'badge': 'Cloudinary CDN Integration',
        'desc':
            'High-resolution multi-photo item upload pipeline for tailors with real-time pricing (PKR), fabric descriptions, and instant catalog syncing.',
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
        'title': 'Onboarding & Role Selection',
        'desc': 'Interactive onboarding introduces bespoke craftsmanship and doorstep services, followed by role selection for Client or Tailor.',
      },
      {
        'step': '02',
        'title': 'Catalog Browsing & Item Selection',
        'desc': 'Clients explore bespoke fashion items across multiple categories with high-res Cloudinary images and transparent base pricing.',
      },
      {
        'step': '03',
        'title': 'Custom Measurement Order & Checkout',
        'desc': 'Client inputs custom fitting parameters and completes checkout through EasyPaisa, JazzCash, Card, or COD.',
      },
      {
        'step': '04',
        'title': 'Tailor Acceptance & Workload Scheduling',
        'desc': 'Verified tailor receives instant order notification, inspects measurements, and accepts the job into active workshop production.',
      },
      {
        'step': '05',
        'title': 'Live Progress Tracking & Doorstep Delivery',
        'desc': 'Firestore updates real-time milestones until the garment is completed, packaged, and delivered directly to the client.',
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
        'title': 'State Management',
        'tech': 'Provider (MultiProvider)',
        'desc': 'Separated state layers for AuthProvider, CatalogProvider, OrderProvider, and TailorWorkflowProvider.',
      },
      {
        'title': 'Realtime Database',
        'tech': 'Firebase Firestore & Auth',
        'desc': 'Real-time document listeners driving order status changes, multi-role credential verification, and live notification counts.',
      },
      {
        'title': 'Image CDN & Media',
        'tech': 'Cloudinary REST API',
        'desc': 'Optimized high-speed media hosting ensuring tailor catalog uploads load quickly without burdening database bandwidth.',
      },
      {
        'title': 'Push Alerts',
        'tech': 'Firebase Cloud Messaging (FCM)',
        'desc': 'Direct push notifications alerting tailors to new order requests and notifying clients as garments advance through production.',
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
      {'path': 'assets/images/stitch/stitch_20_splash_screen.png', 'caption': 'SPLASH SCREEN'},
      {'path': 'assets/images/stitch/stitch_01_bespoke_craftsmanship.png', 'caption': 'BESPOKE CRAFTSMANSHIP'},
      {'path': 'assets/images/stitch/stitch_02_master_artisans.png', 'caption': 'MASTER ARTISANS'},
      {'path': 'assets/images/stitch/stitch_03_delivered_with_care.png', 'caption': 'DELIVERED WITH CARE'},
      {'path': 'assets/images/stitch/stitch_04_welcome_auth.png', 'caption': 'WELCOME & GET STARTED'},
      {'path': 'assets/images/stitch/stitch_05_client_login.png', 'caption': 'CLIENT LOGIN'},
      {'path': 'assets/images/stitch/stitch_06_tailor_login.png', 'caption': 'TAILOR LOGIN'},
      {'path': 'assets/images/stitch/stitch_07_client_home_orders.png', 'caption': 'CLIENT DASHBOARD'},
      {'path': 'assets/images/stitch/stitch_08_order_management.png', 'caption': 'ALL ORDERS'},
      {'path': 'assets/images/stitch/stitch_11_collection_explore.png', 'caption': 'HOT SALES & EXPLORE'},
      {'path': 'assets/images/stitch/stitch_12_secure_checkout.png', 'caption': 'SECURE CHECKOUT'},
      {'path': 'assets/images/stitch/stitch_13_new_order_requests.png', 'caption': 'TAILOR ORDER REQUESTS'},
      {'path': 'assets/images/stitch/stitch_14_tailor_all_orders.png', 'caption': 'TAILOR WORKLOAD'},
      {'path': 'assets/images/stitch/stitch_15_tailor_items_catalog.png', 'caption': 'TAILOR ITEMS'},
      {'path': 'assets/images/stitch/stitch_16_upload_new_item.png', 'caption': 'UPLOAD NEW ITEM'},
      {'path': 'assets/images/stitch/stitch_17_settings_preferences.png', 'caption': 'APP SETTINGS'},
      {'path': 'assets/images/stitch/stitch_18_live_orders_feed.png', 'caption': 'LIVE ORDERS FEED'},
      {'path': 'assets/images/stitch/stitch_19_tailor_verification.png', 'caption': 'ADMIN VERIFICATION'},
      {'path': 'assets/images/stitch/stitch_10_client_profile.png', 'caption': 'USER PROFILE'},
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
            return _InteractiveStitchCard(
              imagePath: item['path']!,
              caption: item['caption']!,
            );
          },
        ),
      ),
    );
  }
}

class _InteractiveStitchCard extends StatefulWidget {
  final String imagePath;
  final String caption;

  const _InteractiveStitchCard({
    required this.imagePath,
    required this.caption,
  });

  @override
  State<_InteractiveStitchCard> createState() => _InteractiveStitchCardState();
}

class _InteractiveStitchCardState extends State<_InteractiveStitchCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bytes = StitchBytes.getBytes(widget.imagePath);

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
