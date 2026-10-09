import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/portfolio_data.dart';
import '../../theme/app_theme.dart';
import '../../utils/helpers.dart';
import '../../widgets/anim_effects.dart';

class StitchAndWitchDetailPage extends StatefulWidget {
  const StitchAndWitchDetailPage({super.key});

  static const String title = 'Stitch&Witch';
  static const String tagline =
      'Bespoke tailoring & fashion platform connecting Tailors, Clients, and Admins with real-time live order tracking.';
  static const String imageUrl =
      'https://images.unsplash.com/photo-1558769132-cb1aea458c5e?auto=format&fit=crop&w=1200&q=80';
  static const List<String> tags = [
    'Flutter',
    'Provider',
    'Firebase',
    'Cloudinary',
    'FCM',
    'Role-Based Auth',
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
          StitchAndWitchDetailPage.title,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
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
                                'FASHION TECH • MULTI-ROLE MARKETPLACE',
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Tech Badges
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: tags.map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: emerald.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: emerald.withValues(alpha: 0.4)),
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

                  // Action Buttons
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
                          'Stitch&Witch is a comprehensive multi-role bespoke fashion and custom tailoring ecosystem built with Flutter. '
                          'The platform bridges the gap between master craftsmen (Tailors), fashion consumers (Clients), and platform operators (Admins). '
                          'It eliminates traditional measurement misunderstandings, provides a Cloudinary-powered showcase for high-resolution bespoke apparel designs, '
                          'and delivers a real-time live order tracking experience through Firebase Cloud Firestore and Firebase Cloud Messaging (FCM).',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),

                  // 4. Three Dedicated Role Portals (Tailor, Client, Admin)
                  InViewReveal(
                    offset: const Offset(0, 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionHeader('Three Dedicated Role Portals'),
                        const SizedBox(height: 14),
                        _buildRolePortalsGrid(isDesktop),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),

                  // 5. Complete End-to-End Workflow Flow
                  InViewReveal(
                    offset: const Offset(0, 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionHeader('End-to-End Application Workflow'),
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

                  // 7. Core Capabilities & Feature Highlights
                  InViewReveal(
                    offset: const Offset(0, 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionHeader('Key Capabilities'),
                        const SizedBox(height: 16),
                        _buildFeatureItem('Multi-Role Authentication: Distinct onboarding & role verification for Clients, Tailors, and Admins via Firebase Auth.'),
                        _buildFeatureItem('Cloudinary Media CDN: Instant upload, compression, and delivery of high-definition clothing textures and tailor portfolios.'),
                        _buildFeatureItem('Category-Driven Product Discovery: Clients seamlessly browse formal, wedding, casual, and custom bespoke clothing categories.'),
                        _buildFeatureItem('Real-Time Order Lifecycle: Instant status transitions (Requested ➔ Accepted ➔ Cutting ➔ Stitching ➔ Dispatched).'),
                        _buildFeatureItem('Push Notifications (FCM): Automated notifications triggered at every milestone so both Tailor and Client stay updated.'),
                        _buildFeatureItem('Admin Control Center: Centralized portal to inspect all platform users, tailors, customer orders, and transaction metrics.'),
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
                          '• Role-Based State Management (Provider): Implemented modular Provider architecture separating ClientProvider, TailorProvider, and AdminProvider. Each provider maintains dedicated ChangeNotifier state listeners, ensuring smooth UI reactivity and zero memory bloat.\n\n'
                          '• Real-Time Order Stream Subscription: When an order is placed, a dedicated Cloud Firestore document stream is listened to by the Client. The moment the Tailor taps "Accept", the Client\'s UI transitions immediately to live tracking without any manual page reload.\n\n'
                          '• High-Performance Cloudinary Optimization: Uploading raw camera images from tailors could cause severe bandwidth consumption. By piping uploads through Cloudinary with auto-formatting (f_auto, q_auto), client image load times were reduced by over 60%.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Back Button
                  Center(
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

  Widget _buildBanner(bool isDesktop) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: isDesktop ? 440 : 260,
        color: cardBg,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _buildFallbackBanner(),
        ),
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
        child: Icon(Icons.checkroom_rounded, size: 64, color: emeraldAccent),
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

  Widget _buildRolePortalsGrid(bool isDesktop) {
    final roles = [
      {
        'role': 'TAILOR PORTAL',
        'icon': Icons.design_services_rounded,
        'badge': 'Product & Order Management',
        'desc':
            'Tailors upload their bespoke creations and design catalogs directly to Cloudinary. '
            'They specify categories, fabric types, and pricing. When a client places an order, '
            'the tailor receives real-time requests with body measurements, can accept/reject commissions, '
            'and updates the live progress stages.',
      },
      {
        'role': 'CLIENT PORTAL',
        'icon': Icons.person_outline_rounded,
        'badge': 'Browse & Live Tracking',
        'desc':
            'Clients explore categorized apparel catalogs featuring high-definition Cloudinary imagery. '
            'They customize styles, enter their precise body measurements, and send direct commission requests. '
            'As soon as the tailor accepts the order, clients unlock live step-by-step progress tracking.',
      },
      {
        'role': 'ADMIN CONTROL PANEL',
        'icon': Icons.admin_panel_settings_outlined,
        'badge': 'System & Platform Oversight',
        'desc':
            'Administrators enjoy total platform supervision: managing all registered users (both clients and tailors), '
            'monitoring incoming, active, and completed orders across the platform, and maintaining catalog quality control.',
      },
    ];

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: roles.map((r) {
          return Expanded(
            child: HoverElevate(
              translateY: -6,
              scale: 1.02,
              glowColor: emeraldAccent,
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
                          child: Icon(r['icon'] as IconData, color: emeraldAccent, size: 28),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                r['role'] as String,
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
                                  r['badge'] as String,
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
                      r['desc'] as String,
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
      children: roles.map((r) {
        return HoverElevate(
          translateY: -4,
          scale: 1.01,
          glowColor: emeraldAccent,
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
                  child: Icon(r['icon'] as IconData, color: emeraldAccent, size: 28),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            r['role'] as String,
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
                              r['badge'] as String,
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
                        r['desc'] as String,
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
        'title': 'Tailor Uploads Product',
        'desc': 'Tailor creates a new design listing with categorized tags. High-resolution garment images are directly uploaded and optimized via Cloudinary CDN.',
      },
      {
        'step': '02',
        'title': 'Client Discovers & Orders',
        'desc': 'The product instantly appears in the Client app under its respective category. The client inputs custom body measurements and places the commission order.',
      },
      {
        'step': '03',
        'title': 'Tailor Receives & Accepts Order',
        'desc': 'The tailor gets an instant real-time notification via Firebase Cloud Messaging (FCM). Upon reviewing the details, the tailor accepts the order.',
      },
      {
        'step': '04',
        'title': 'Live Order Tracking Initiated',
        'desc': 'Once accepted, the Client screen automatically initiates real-time live tracking: Fabric Sourced ➔ Cutting ➔ Stitching ➔ Quality Check ➔ Out for Delivery.',
      },
      {
        'step': '05',
        'title': 'Admin Oversight & Analytics',
        'desc': 'Platform Admins view all active orders and manage both Tailor and Client profiles from the central management portal.',
      },
    ];

    return Column(
      children: [
        for (int i = 0; i < steps.length; i++)
          InViewReveal(
            delay: Duration(milliseconds: 70 * i),
            offset: const Offset(0, 25),
            child: HoverElevate(
              translateY: -3,
              glowColor: emeraldAccent,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 14),
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
                            steps[i]['step']!,
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
                              steps[i]['title']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15.5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              steps[i]['desc']!,
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
            ),
          ),
      ],
    );
  }

  Widget _buildArchitectureGrid(bool isDesktop) {
    final items = [
      {'title': 'State Management (Provider)', 'desc': 'Reactive ChangeNotifier architecture decoupling Client, Tailor, and Admin UI workflows.'},
      {'title': 'Firebase Cloud Firestore', 'desc': 'Real-time document streams for order lifecycle milestones, product listings, and chats.'},
      {'title': 'Firebase Authentication', 'desc': 'Role-Based Access Control (RBAC) granting tailored portal permissions to Client, Tailor, and Admin.'},
      {'title': 'Cloudinary Media CDN', 'desc': 'High-performance cloud image hosting with auto-format (f_auto, q_auto) and thumbnail generation.'},
      {'title': 'Push Notifications (FCM)', 'desc': 'Firebase Cloud Messaging delivering instant order requests, acceptance alerts, and tracking pings.'},
      {'title': 'Admin Oversight Engine', 'desc': 'Aggregated collection queries for full user and order monitoring across all accounts.'},
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final cols = constraints.maxWidth > 950 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
        final w = (constraints.maxWidth - 16 * (cols - 1)) / cols;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            for (int i = 0; i < items.length; i++)
              InViewReveal(
                delay: Duration(milliseconds: 50 * i),
                offset: const Offset(0, 25),
                child: SizedBox(
                  width: w,
                  child: HoverElevate(
                    translateY: -4,
                    glowColor: emeraldAccent,
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
                            items[i]['title']!,
                            style: const TextStyle(
                              color: emeraldAccent,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            items[i]['desc']!,
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
                ),
              ),
          ],
        );
      },
    );
  }
}
