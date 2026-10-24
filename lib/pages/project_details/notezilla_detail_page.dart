import '../../utils/ai_notezilla_bytes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_theme.dart';
import '../../widgets/anim_effects.dart';

class NoteZillaDetailPage extends StatefulWidget {
  const NoteZillaDetailPage({super.key});

  static const String title = 'Ai NoteZilla';
  static const String tagline =
      'AI-powered intelligent notes studio with smart summarization, title generation, clarity polishing, and multimedia audio/video memos.';
  static const String imageUrl = 'assets/images/ai_notezilla_card_banner.png';
  static const List<String> tags = [
    'Flutter',
    'Provider',
    'AI Summarizer',
    'Title Generator',
    'Clarity & Tone',
    'Audio & Video Notes',
    'Firebase',
    'Cloudinary',
  ];

  @override
  State<NoteZillaDetailPage> createState() => _NoteZillaDetailPageState();
}

class _NoteZillaDetailPageState extends State<NoteZillaDetailPage> {
  final _scrollController = ScrollController();

  String get title => NoteZillaDetailPage.title;
  String get tagline => NoteZillaDetailPage.tagline;
  String get imageUrl => NoteZillaDetailPage.imageUrl;
  List<String> get tags => NoteZillaDetailPage.tags;

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


                    // 2. Title & Status
                    FadeSlideIn(
                      offset: const Offset(0, 20),
                      delay: const Duration(milliseconds: 150),
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
                            'NoteZilla is a comprehensive multimedia productivity app enabling users to capture thoughts in any format: Text Notes, Voice / Audio Memos, and Recorded Video Notes. '
                            'Secured by Firebase Authentication, all user notes and structured metadata are synchronized to Cloud Firestore in real time. '
                            'To ensure blazing performance and lightweight database storage, heavy video and audio attachments are automatically uploaded and streamed through Cloudinary CDN. '
                            'Users enjoy full editability to update note content, re-record audio snippets, and organize their personal digital workspace anytime.',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 4. Multimedia Note Formats (Text, Audio, Video)
                    InViewReveal(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Triple-Format Note Engine'),
                          const SizedBox(height: 14),
                          _buildNoteFormatsGrid(isDesktop),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 5. Complete Step-by-Step Workflow
                    InViewReveal(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Note Lifecycle & Cloud Pipeline'),
                          const SizedBox(height: 14),
                          _buildWorkflowSteps(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 6. Technical Architecture & Tech Stack
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

                    // 7. Core Capabilities
                    InViewReveal(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Key Capabilities'),
                          const SizedBox(height: 16),
                          _buildFeatureItem('Triple Note Types: Rich formatted Text notes, crystal-clear Audio voice notes, and recorded Video notes.'),
                          _buildFeatureItem('Full In-App Editability: Real-time editing of note titles, body descriptions, and multimedia attachments.'),
                          _buildFeatureItem('Cloudinary CDN Media Engine: High-speed streaming, compression, and hosting for video and audio recordings.'),
                          _buildFeatureItem('Firebase Authentication: Secure account creation, encrypted user credentials, and multi-device access.'),
                          _buildFeatureItem('Firebase Cloud Firestore: Real-time document storage for instant note syncing across devices.'),
                          _buildFeatureItem('Provider State Architecture: Dedicated NotesProvider and MediaRecorderProvider ensuring reactive UI updates.'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 8. Engineering Highlights
                    InViewReveal(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Engineering & Architectural Solutions'),
                          const SizedBox(height: 14),
                          _buildInfoCard(
                            '• Unified Note Serialization: Implemented a polymorphic Note model that gracefully handles varying payloads (plain text, audio durations with Cloudinary audio URLs, and video player aspect ratios).\n\n'
                            '• Direct-to-Cloudinary Multipart Uploads: Video and audio files bypass Firebase Firestore storage bottlenecks by streaming directly to Cloudinary using signed upload presets, saving database bandwidth and providing fast CDN playback.\n\n'
                            '• Reactive Note Editing via Provider: Built an inline editor backed by NotesProvider with debounced auto-save listeners, guaranteeing that edits are persisted to Firestore without lag or race conditions.',
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

  Widget _buildBanner(bool isDesktop) {
    final bytes = AiNoteZillaBytes.getBytes('assets/images/ai_notezilla_card_banner.png');
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: isDesktop ? 440 : 260,
        color: cardBg,
        child: bytes != null && bytes.isNotEmpty
            ? Image.memory(
                bytes,
                fit: BoxFit.fill,
                gaplessPlayback: true,
              )
            : Image.asset(
                imageUrl,
                fit: BoxFit.fill,
                gaplessPlayback: true,
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
        border: Border.all(color: line),
      ),
      child: const Center(
        child: Icon(Icons.description_outlined, size: 64, color: emeraldAccent),
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

  Widget _buildNoteFormatsGrid(bool isDesktop) {
    final formats = [
      {
        'title': 'TEXT NOTES',
        'icon': Icons.format_quote_rounded,
        'badge': 'Real-Time Editing',
        'desc':
            'Clean markdown-friendly text editor with instant auto-save to Firebase Firestore. '
            'Users can revise notes anytime with complete revision history and tag organization.',
      },
      {
        'title': 'AUDIO NOTES',
        'icon': Icons.mic_none_rounded,
        'badge': 'Cloudinary Audio Hosting',
        'desc':
            'One-tap high-fidelity voice memo recorder with waveform visualizer. '
            'Directly uploaded to Cloudinary for instant playback streaming across devices.',
      },
      {
        'title': 'VIDEO NOTES',
        'icon': Icons.videocam_outlined,
        'badge': 'Cloudinary Video Streaming',
        'desc':
            'Integrated camera recorder to capture quick visual memos and video demonstrations. '
            'Stored on Cloudinary with auto-transcoding for instant high-speed bufferless playback.',
      },
    ];

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: formats.map((f) {
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
                          child: Icon(f['icon'] as IconData, color: emeraldAccent, size: 28),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                f['title'] as String,
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
                                  f['badge'] as String,
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
                      f['desc'] as String,
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
      children: formats.map((f) {
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
                  child: Icon(f['icon'] as IconData, color: emeraldAccent, size: 28),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            f['title'] as String,
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
                              f['badge'] as String,
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
                        f['desc'] as String,
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
        'title': 'Firebase Authentication',
        'desc': 'User logs in or signs up securely via Firebase Auth, protecting personal notes with individual user IDs.',
      },
      {
        'step': '02',
        'title': 'Note Creation (Text, Audio, or Video)',
        'desc': 'User chooses between typing a text note, recording an audio memo, or capturing a video clip.',
      },
      {
        'step': '03',
        'title': 'Cloudinary Upload & URL Generation',
        'desc': 'Media files (audio/video) are uploaded to Cloudinary CDN, generating secure, optimized streaming URLs.',
      },
      {
        'step': '04',
        'title': 'Firestore Real-Time Persistence',
        'desc': 'The note payload (title, content, media URLs, timestamps) is saved directly into Firebase Cloud Firestore.',
      },
      {
        'step': '05',
        'title': 'Seamless Editing & Revisions',
        'desc': 'User can open any existing note to edit text, update media attachments, or adjust organization tags with instant sync.',
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
      {'title': 'State Management (Provider)', 'desc': 'NotesProvider and MediaProvider managing real-time Firestore streams and upload states.'},
      {'title': 'Firebase Cloud Firestore', 'desc': 'Structured NoSQL database storing note content, category tags, and timestamps.'},
      {'title': 'Firebase Authentication', 'desc': 'Securing individual user workspaces and protecting private note data.'},
      {'title': 'Cloudinary CDN Media Storage', 'desc': 'High-performance cloud storage and adaptive streaming for recorded audio and video notes.'},
      {'title': 'Dynamic Note Editing', 'desc': 'Real-time text manipulation and media asset updating with instant save callbacks.'},
      {'title': 'Offline-First Caching', 'desc': 'Local storage cache keeping existing notes accessible even without active internet.'},
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
      {'path': 'assets/images/ai_notezilla/note_01_splash_screen.png', 'caption': 'SPLASH SCREEN'},
      {'path': 'assets/images/ai_notezilla/note_02_ai_smart_summarizer.png', 'caption': 'AI SMART SUMMARIZER'},
      {'path': 'assets/images/ai_notezilla/note_03_smart_title_generator.png', 'caption': 'SMART TITLE GENERATOR'},
      {'path': 'assets/images/ai_notezilla/note_04_flawless_clarity_tone.png', 'caption': 'CLARITY & TONE POLISH'},
      {'path': 'assets/images/ai_notezilla/note_05_auth_sign_in.png', 'caption': 'AUTH & SIGN IN'},
      {'path': 'assets/images/ai_notezilla/note_06_home_multimedia_dashboard.png', 'caption': 'HOME DASHBOARD'},
      {'path': 'assets/images/ai_notezilla/note_07_create_note_ai_assist.png', 'caption': 'CREATE NOTE & AI ASSIST'},
      {'path': 'assets/images/ai_notezilla/note_08_audio_memo_recording.png', 'caption': 'AUDIO MEMO & WAVEFORM'},
      {'path': 'assets/images/ai_notezilla/note_09_video_note_camera.png', 'caption': 'VIDEO NOTE CAMERA'},
      {'path': 'assets/images/ai_notezilla/note_10_ai_assist_features.png', 'caption': 'AI ASSIST TOOLS'},
      {'path': 'assets/images/ai_notezilla/note_11_search_and_filter_notes.png', 'caption': 'SEARCH & DATE FILTER'},
      {'path': 'assets/images/ai_notezilla/note_12_app_settings.png', 'caption': 'APP SETTINGS'},
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
            return _InteractiveNoteZillaCard(
              imagePath: item['path']!,
              caption: item['caption']!,
            );
          },
        ),
      ),
    );
  }
}

class _InteractiveNoteZillaCard extends StatefulWidget {
  final String imagePath;
  final String caption;

  const _InteractiveNoteZillaCard({
    required this.imagePath,
    required this.caption,
  });

  @override
  State<_InteractiveNoteZillaCard> createState() => _InteractiveNoteZillaCardState();
}

class _InteractiveNoteZillaCardState extends State<_InteractiveNoteZillaCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bytes = AiNoteZillaBytes.getBytes(widget.imagePath);

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
