import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_theme.dart';
import '../../utils/chatflow_bytes.dart';
import '../../widgets/anim_effects.dart';

class ChatFlowDetailPage extends StatefulWidget {
  const ChatFlowDetailPage({super.key});

  static const String title = 'ChatFlow';
  static const String tagline =
      'Real-time communication suite featuring connection-gated chat, stories/status updates, and ZegoCloud HD voice & video calling.';
  static const String imageUrl = 'assets/images/chatflow_logo.png';
  static const List<String> tags = [
    'Flutter',
    'Provider',
    'Firebase Auth & Firestore',
    'ZegoCloud Audio/Video RTC',
    'FCM Push Alerts',
    'End-to-End Encryption',
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
                            'ChatFlow is a next-generation real-time communication platform built with Flutter, Provider, Firebase, and ZegoCloud. '
                            'Engineered with a strict privacy-first architecture, ChatFlow features connection-gated direct messaging where conversations '
                            'only unlock once a recipient accepts an incoming request. Users enjoy crystal-clear HD voice & video calls, ephemeral status stories, '
                            'biometric-guarded security, and lightning-fast cloud synchronization with zero battery drain.',
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
                          _buildFeatureItem('Permission-Gated Direct Messaging: Anti-spam security protocol ensuring chats activate only upon accepted requests.'),
                          _buildFeatureItem('ZegoCloud WebRTC Calling: Studio-grade lossless HD audio and low-latency 4K video calling with adaptive bitrate.'),
                          _buildFeatureItem('Discovery & Moments: 24-hour ephemeral status updates with custom captions, photo previews, and camera shortcuts.'),
                          _buildFeatureItem('Biometric & AES-256 Security: Fortress privacy safeguards with zero trackers, device-encrypted keys, and PIN locks.'),
                          _buildFeatureItem('Live Request Center: Intuitive pending request approval hub with real-time badge count and instant response actions.'),
                          _buildFeatureItem('Call History & Contact Dialing: Comprehensive voice & video call records with one-tap redialing and contact search.'),
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
        'screen': 'CHAT WITHOUT LIMITS',
        'icon': Icons.bolt_rounded,
        'badge': 'Lightning Fast Sync',
        'desc':
            'Real-time messaging engine with instant voice notes, HD media sharing, animated typing indicators, and sub-second delivery syncing.',
      },
      {
        'screen': 'CRYSTAL-CLEAR CALLING',
        'icon': Icons.video_call_rounded,
        'badge': 'ZegoCloud Studio Audio & 4K',
        'desc':
            'Ultra-low latency voice & lag-free HD video calling powered by ZegoCloud RTC. Optimized to maintain clear connection even on weak mobile networks.',
      },
      {
        'screen': 'PRIVATE BY DEFAULT',
        'icon': Icons.shield_rounded,
        'badge': 'Fortress Privacy & AES-256',
        'desc':
            'End-to-end encryption security layer with zero tracker analytics, zero user logs, and device-bound security keys for total peace of mind.',
      },
      {
        'screen': 'DISCOVERY & MOMENTS',
        'icon': Icons.camera_alt_rounded,
        'badge': '24H Status Stories',
        'desc':
            'Share daily moments, quick photo updates, and text thoughts that disappear after 24 hours, visible exclusively to your accepted connections.',
      },
      {
        'screen': 'PERMISSION-GATED REQUESTS',
        'icon': Icons.person_add_rounded,
        'badge': 'Anti-Spam Filter',
        'desc':
            'Strict connection request gatekeeping: unknown contacts cannot message or call until you review and approve their connection invitation.',
      },
      {
        'screen': 'CALL CENTER & DIALER',
        'icon': Icons.phone_in_talk_rounded,
        'badge': 'Unified Calling Hub',
        'desc':
            'Integrated voice & video communication dashboard featuring complete call logs, direct friend dialer, and one-tap callback capability.',
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
        'title': 'Splash & Biometric Handshake',
        'desc': 'App launches with high-contrast animated splash, initializes Firebase Auth & ZegoCloud RTC engines, and checks active session credentials.',
      },
      {
        'step': '02',
        'title': 'Onboarding & Permission Authorization',
        'desc': 'Interactive onboarding flow detailing real-time chat, HD calling, and privacy guarantees followed by secure biometric or email authentication.',
      },
      {
        'step': '03',
        'title': 'User Discovery & Friend Request Gate',
        'desc': 'Users search contacts by username/email. Direct communication is locked until an invitation request is sent and accepted by the recipient.',
      },
      {
        'step': '04',
        'title': 'Real-Time Messaging & Status Sharing',
        'desc': 'Once connected, users exchange real-time messages with typing states and read receipts, alongside publishing 24-hour visual status moments.',
      },
      {
        'step': '05',
        'title': 'Lossless Audio & HD Video Calling',
        'desc': 'Initiate studio-quality voice and video calls through ZegoCloud RTC SDK with native call screen wakeups and crystal-clear acoustic echo cancellation.',
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
        'tech': 'Provider (ChangeNotifier)',
        'desc': 'Decoupled presentation logic handling auth tokens, real-time message feeds, call session states, and status feeds.',
      },
      {
        'title': 'Realtime Backend',
        'tech': 'Firebase Firestore & Auth',
        'desc': 'NoSQL document snapshots for instant messaging delivery, user presence detection, typing indicators, and secure authentication.',
      },
      {
        'title': 'Voice & Video RTC',
        'tech': 'ZegoCloud Express Video SDK',
        'desc': 'Enterprise WebRTC RTC engine handling token authentication, audio noise suppression, dynamic video bitrate, and CallKit integrations.',
      },
      {
        'title': 'Cloud Notifications',
        'tech': 'Firebase Cloud Messaging (FCM)',
        'desc': 'High-priority silent and display push notification payloads triggering native full-screen incoming call wakeups and message badges.',
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
      {'path': 'assets/images/chatflow/chatflow_splash.png', 'caption': 'SPLASH SCREEN'},
      {'path': 'assets/images/chatflow/chatflow_chat_without_limits.png', 'caption': 'CHAT WITHOUT LIMITS'},
      {'path': 'assets/images/chatflow/chatflow_crystal_clear_calling.png', 'caption': 'CRYSTAL-CLEAR CALLING'},
      {'path': 'assets/images/chatflow/chatflow_private_by_default.png', 'caption': 'PRIVATE BY DEFAULT'},
      {'path': 'assets/images/chatflow/chatflow_auth_login.png', 'caption': 'SECURE AUTHENTICATION'},
      {'path': 'assets/images/chatflow/chatflow_messages_inbox.png', 'caption': 'MESSAGES INBOX'},
      {'path': 'assets/images/chatflow/chatflow_discovery_moments.png', 'caption': 'DISCOVERY MOMENTS'},
      {'path': 'assets/images/chatflow/chatflow_voice_video_calls.png', 'caption': 'VOICE & VIDEO CALLS'},
      {'path': 'assets/images/chatflow/chatflow_profile_settings.png', 'caption': 'USER PROFILE'},
      {'path': 'assets/images/chatflow/chatflow_pending_requests.png', 'caption': 'PENDING REQUESTS'},
      {'path': 'assets/images/chatflow/chatflow_account_settings.png', 'caption': 'SECURITY SETTINGS'},
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
          return _InteractiveChatflowCard(
            imagePath: item['path']!,
            caption: item['caption']!,
          );
        },
        ),
      ),
    );
  }
}

class _InteractiveChatflowCard extends StatefulWidget {
  final String imagePath;
  final String caption;

  const _InteractiveChatflowCard({
    required this.imagePath,
    required this.caption,
  });

  @override
  State<_InteractiveChatflowCard> createState() => _InteractiveChatflowCardState();
}

class _InteractiveChatflowCardState extends State<_InteractiveChatflowCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bytes = ChatflowBytes.getBytes(widget.imagePath);

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
                    if (bytes != null && bytes.isNotEmpty)
                      Image.memory(
                        bytes,
                        fit: BoxFit.fill,
                        gaplessPlayback: true,
                      )
                    else
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
