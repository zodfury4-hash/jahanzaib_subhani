import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/helpers.dart';

class NavBar extends StatelessWidget {
  final Map<String, VoidCallback> items;
  const NavBar({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.of(context).size.width > 900;
    final compact = MediaQuery.of(context).size.width < 600;

    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 16 : 36,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left: Signature Brand Logo
          const Text(
            'Jahanzaib',
            style: TextStyle(
              fontFamily: 'SpaceGrotesk',
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),

          // Center: Rounded Pill Navbar (if not too compact)
          // Center: Rounded Pill Navbar (Dark Luxury Glassmorphic + Emerald Glow)
          if (!compact)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF0F1117).withValues(alpha: 0.92),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: emerald.withValues(alpha: 0.45),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: emerald.withValues(alpha: 0.22),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final e in items.entries)
                    _NavPillItem(
                      title: e.key,
                      onTap: e.value,
                    ),
                ],
              ),
            ),

          // Right: Social Links List (desktop) or Menu
          if (wide)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                _SocialLink(label: 'WHATSAPP', url: whatsapp),
                const SizedBox(height: 4),
                _SocialLink(label: 'LINKEDIN', url: linkedin),
                const SizedBox(height: 4),
                _SocialLink(label: 'EMAIL', url: 'mailto:$email'),
              ],
            )
          else if (compact)
            // Mobile compact icon row
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.chat_bubble_outline, color: emeraldAccent, size: 19),
                  tooltip: 'WhatsApp',
                  onPressed: () => openUrl(whatsapp),
                ),
                IconButton(
                  icon: const Icon(Icons.link, color: Colors.white, size: 20),
                  tooltip: 'LinkedIn',
                  onPressed: () => openUrl(linkedin),
                ),
                IconButton(
                  icon: const Icon(Icons.mail_outline, color: Colors.white, size: 20),
                  tooltip: 'Email',
                  onPressed: () => openUrl('mailto:$email'),
                ),
              ],
            )
          else
            const SizedBox(width: 80),
        ],
      ),
    );
  }
}

class _SocialLink extends StatefulWidget {
  final String label;
  final String url;
  const _SocialLink({required this.label, required this.url});

  @override
  State<_SocialLink> createState() => _SocialLinkState();
}

class _SocialLinkState extends State<_SocialLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => openUrl(widget.url),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          style: TextStyle(
            fontFamily: 'SpaceGrotesk',
            color: _hovered ? emeraldAccent : const Color(0xFF9094A0),
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}

class _NavPillItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavPillItem({required this.title, required this.onTap});

  @override
  State<_NavPillItem> createState() => _NavPillItemState();
}

class _NavPillItemState extends State<_NavPillItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: _hovered
                ? emerald.withValues(alpha: 0.22)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _hovered
                  ? emeraldAccent.withValues(alpha: 0.45)
                  : Colors.transparent,
              width: 1.0,
            ),
          ),
          child: Text(
            widget.title.toUpperCase(),
            style: TextStyle(
              fontFamily: 'SpaceGrotesk',
              color: _hovered ? emeraldAccent : const Color(0xFFE2E6EF),
              fontSize: 12.5,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.3,
            ),
          ),
        ),
      ),
    );
  }
}


