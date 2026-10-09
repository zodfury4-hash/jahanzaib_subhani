import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/portfolio_data.dart';
import '../../theme/app_theme.dart';
import '../../utils/helpers.dart';
import '../../widgets/anim_effects.dart';

class ChatFlowDetailPage extends StatefulWidget {
  const ChatFlowDetailPage({super.key});

  static const String title = 'ChatFlow';
  static const String tagline =
      'Real-time communication suite featuring connection-gated chat, stories/status updates, and ZegoCloud HD voice & video calling.';
  static const String imageUrl =
      'https://images.unsplash.com/photo-1611746872915-64382b5c76da?auto=format&fit=crop&w=1200&q=80';
  static const List<String> tags = [
    'Flutter',
    'Provider',
    'Firebase',
    'ZegoCloud',
    'FCM',
    'Realtime Sync',
  ];

  @override
  State<ChatFlowDetailPage> createState() => _ChatFlowDetailPageState();
}

class _ChatFlowDetailPageState extends State<ChatFlowDetailPage> {
  final _scrollController = ScrollController();

  String get title => ChatFlowDetailPage.title;
  String get tagline => ChatFlowDetailPage.tagline;
  String get imageUrl => ChatFlowDetailPage.imageUrl;
  List<String> get tags => ChatFlowDetailPage.tags;

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
                                'REAL-TIME WEBRTC • INSTANT MESSAGING & CALLING',
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
                          'ChatFlow is a modern, high-performance instant communication application designed for seamless connection, multimedia sharing, and crystal-clear voice/video calling. '
                          'The app follows a secure connection-first philosophy: users can search for contacts by name and send friend requests, but chat messaging remains completely locked until the recipient explicitly accepts the invitation. '
                          'Additionally, users can publish stories/status updates that are exclusively visible to their connected friends, fostering privacy and trusted social circles.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),

                  // 4. Screen Architecture & Core User Journey (Splash ➔ Auth ➔ Home)
                  InViewReveal(
                    offset: const Offset(0, 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionHeader('Screen Flow & Core User Journey'),
                        const SizedBox(height: 14),
                        _buildScreenFlowGrid(isDesktop),
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
                        _buildSectionHeader('Step-by-Step Communication Pipeline'),
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
                        _buildFeatureItem('Privacy-Gated Messaging: Anti-spam connection protocol ensuring only accepted friends can initiate chat conversations.'),
                        _buildFeatureItem('Stories & Status Updates: Upload ephemeral photo and text statuses visible strictly to confirmed friends.'),
                        _buildFeatureItem('HD Audio & Video Calling: Low-latency WebRTC conferencing engine powered by ZegoCloud UIKit and CallKit.'),
                        _buildFeatureItem('Reactive State Management: Modular Provider architecture handling auth state, real-time message streams, and calling sessions.'),
                        _buildFeatureItem('Firebase Realtime Ecosystem: Firestore document snapshots for sub-second messaging, presence detection, and typing ticks.'),
                        _buildFeatureItem('Push Notifications (FCM): High-priority background wakeups for incoming calls, connection requests, and new messages.'),
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
                          '• Permission-Gated Firestore Security Rules: Implemented Firestore security rules preventing document writes to /messages unless a mutual friendship document with status == "accepted" exists between the sender and receiver IDs.\n\n'
                          '• ZegoCloud State & Call Lifecycle Management: Used Provider (CallProvider) to orchestrate call initialization, token generation, camera flipping, mic muting, and proper cleanup to prevent audio/video hardware leaks when disconnecting.\n\n'
                          '• Background VoIP Ringer via FCM: Integrated Firebase Cloud Messaging data payloads with flutter_callkit_incoming, waking up the device screen with a native full-screen incoming call UI even when the app is terminated in the background.',
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
        child: Icon(Icons.video_call_rounded, size: 64, color: emeraldAccent),
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
        'badge': 'Startup & Auth Check',
        'desc':
            'Initial entry point that checks network connectivity, initializes Firebase & ZegoCloud SDKs, '
            'and validates the persistent Firebase Auth token to route users automatically to Auth or Home.',
      },
      {
        'screen': 'AUTHENTICATION SCREEN',
        'icon': Icons.lock_outline_rounded,
        'badge': 'Firebase Auth & Profile',
        'desc':
            'Clean registration and login interface with email/password authentication, avatar selection, '
            'and real-time validation, storing user credentials securely in Firebase Authentication.',
      },
      {
        'screen': 'HOME DASHBOARD',
        'icon': Icons.chat_bubble_outline_rounded,
        'badge': 'Chat, Status & Search Hub',
        'desc':
            'The central social hub containing active chats, incoming friend requests, a live stories/status carousel, '
            'and a real-time search bar to find and connect with other users by name.',
      },
    ];

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: screens.map((s) {
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
        'title': 'User Discovery & Friend Request',
        'desc': 'On the Home screen, a user searches for another user by name and taps "Send Request". An instant notification is dispatched via FCM.',
      },
      {
        'step': '02',
        'title': 'Connection Lock (Messaging Gated)',
        'desc': 'Until the recipient accepts the request, direct messaging is strictly restricted to eliminate spam and protect privacy.',
      },
      {
        'step': '03',
        'title': 'Request Acceptance & Chat Unlock',
        'desc': 'Once the recipient taps "Accept Request", a mutual friendship stream is established, unlocking instant real-time text and media messaging.',
      },
      {
        'step': '04',
        'title': 'Friends-Only Status & Stories',
        'desc': 'Users post daily photos and text status updates. These ephemeral stories are strictly shared only with confirmed friends on their feed.',
      },
      {
        'step': '05',
        'title': 'ZegoCloud Voice & Video Calling',
        'desc': 'Friends can launch 1-on-1 HD voice and video calls with real-time audio controls, camera toggle, and low-latency WebRTC streams powered by ZegoCloud.',
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
      {'title': 'State Management (Provider)', 'desc': 'Modular ChangeNotifier providers (AuthProvider, ChatProvider, CallProvider, StatusProvider).'},
      {'title': 'Audio & Video Calling (ZegoCloud)', 'desc': 'ZegoCloud RTC / Express SDK providing low-latency, high-definition voice and video conferencing.'},
      {'title': 'Realtime Chat & Streams (Firebase)', 'desc': 'Firebase Cloud Firestore indexed snapshot streams for sub-second messaging and presence.'},
      {'title': 'Authentication & Security', 'desc': 'Firebase Auth with secure session persistence and Firestore connection-gated security rules.'},
      {'title': 'Push Notifications (FCM)', 'desc': 'Firebase Cloud Messaging triggering instant incoming call ringers and friend request pings.'},
      {'title': 'Media & Stories CDN', 'desc': 'High-performance cloud storage and image caching for user avatars, media messages, and statuses.'},
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
