import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Smooth Fade + Slide In entrance animation with customizable delay
class FadeSlideIn extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Offset offset;
  final Curve curve;

  const FadeSlideIn({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 700),
    this.offset = const Offset(0, 35),
    this.curve = Curves.easeOutCubic,
  });

  @override
  State<FadeSlideIn> createState() => _FadeSlideInState();
}

class _FadeSlideInState extends State<FadeSlideIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.duration);
    _fade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: widget.curve),
    );
    _slide = Tween<Offset>(begin: widget.offset, end: Offset.zero).animate(
      CurvedAnimation(parent: _ctrl, curve: widget.curve),
    );

    if (widget.delay == Duration.zero) {
      _ctrl.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _ctrl.forward();
      });
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: AnimatedBuilder(
        animation: _slide,
        child: widget.child,
        builder: (context, cachedChild) {
          return Transform.translate(
            offset: _slide.value,
            child: cachedChild,
          );
        },
      ),
    );
  }
}

/// Spring Scale & Slide entrance for heavy punchy elements
class SpringReveal extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;

  const SpringReveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 850),
  });

  @override
  State<SpringReveal> createState() => _SpringRevealState();
}

class _SpringRevealState extends State<SpringReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.duration);
    _scale = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack),
    );
    _fade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOut),
    );

    if (widget.delay == Duration.zero) {
      _ctrl.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _ctrl.forward();
      });
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (context, child) {
        return Opacity(
          opacity: _fade.value,
          child: Transform.scale(
            scale: _scale.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}

/// Interactive Hover widget that scales and elevates smoothly with flawless shadow fade
class HoverElevate extends StatefulWidget {
  final Widget child;
  final double translateY;
  final double scale;
  final Color? glowColor;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback? onTap;

  const HoverElevate({
    super.key,
    required this.child,
    this.translateY = -5.0,
    this.scale = 1.02,
    this.glowColor,
    this.borderRadius,
    this.onTap,
  });

  @override
  State<HoverElevate> createState() => _HoverElevateState();
}

class _HoverElevateState extends State<HoverElevate> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = widget.borderRadius ?? BorderRadius.circular(16);
    final glow = widget.glowColor ?? emeraldAccent;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: widget.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0.0, _hovered ? widget.translateY : 0.0, 0.0)
            ..multiply(Matrix4.diagonal3Values(
                _hovered ? widget.scale : 1.0, _hovered ? widget.scale : 1.0, 1.0)),
          decoration: BoxDecoration(
            borderRadius: effectiveRadius,
            boxShadow: [
              BoxShadow(
                color: _hovered
                    ? glow.withValues(alpha: 0.22)
                    : Colors.transparent,
                blurRadius: _hovered ? 24.0 : 0.0,
                offset: _hovered ? const Offset(0, 8) : Offset.zero,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

/// Continuous subtle floating animation
class FloatingBobbing extends StatefulWidget {
  final Widget child;
  final double distance;
  final Duration duration;

  const FloatingBobbing({
    super.key,
    required this.child,
    this.distance = 8.0,
    this.duration = const Duration(milliseconds: 3200),
  });

  @override
  State<FloatingBobbing> createState() => _FloatingBobbingState();
}

class _FloatingBobbingState extends State<FloatingBobbing>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
    _anim = Tween<double>(begin: -widget.distance / 2, end: widget.distance / 2)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOutSine));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _anim.value),
          child: widget.child,
        );
      },
    );
  }
}

/// Floating Cyber / Glassmorphic Tech Badge (e.g. "⚡ 120 FPS Fluid Motion", "🚀 Flutter Architect")
class FloatingTechBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;

  const FloatingTechBadge({
    super.key,
    required this.icon,
    required this.label,
    this.iconColor = emeraldAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0F1117).withValues(alpha: 0.88),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: emeraldAccent.withValues(alpha: 0.4), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: emerald.withValues(alpha: 0.25),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: iconColor),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

/// Live pulsing green radar dot (indicates active / available for projects)
class PulsingStatusDot extends StatefulWidget {
  final Color color;
  const PulsingStatusDot({super.key, this.color = emeraldAccent});

  @override
  State<PulsingStatusDot> createState() => _PulsingStatusDotState();
}

class _PulsingStatusDotState extends State<PulsingStatusDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1400))
      ..repeat(reverse: true);
    _pulse = Tween<double>(begin: 0.4, end: 1.0)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulse,
      builder: (context, child) {
        return Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: widget.color.withValues(alpha: _pulse.value * 0.7),
                blurRadius: 10 * _pulse.value,
                spreadRadius: 3 * _pulse.value,
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Top glowing scroll progress indicator line
class ScrollProgressBar extends StatefulWidget {
  final ScrollController scrollController;
  const ScrollProgressBar({super.key, required this.scrollController});

  @override
  State<ScrollProgressBar> createState() => _ScrollProgressBarState();
}

class _ScrollProgressBarState extends State<ScrollProgressBar> {
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!widget.scrollController.hasClients) return;
    final max = widget.scrollController.position.maxScrollExtent;
    final current = widget.scrollController.offset;
    if (max > 0) {
      final p = (current / max).clamp(0.0, 1.0);
      if (p != _progress) {
        setState(() => _progress = p);
      }
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.5,
      width: double.infinity,
      color: Colors.transparent,
      alignment: Alignment.centerLeft,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth * _progress,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF0E7A5A),
                Color(0xFF139D74),
                Color(0xFF1FD69E),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: emeraldAccent.withValues(alpha: 0.6),
                blurRadius: 8,
                offset: const Offset(0, 1),
              ),
            ],
          ),
        );
      }),
    );
  }
}

/// Background animated ambient green particles and breathing light aura
class CyberAmbientBackground extends StatefulWidget {
  const CyberAmbientBackground({super.key});

  @override
  State<CyberAmbientBackground> createState() => _CyberAmbientBackgroundState();
}

class _CyberAmbientBackgroundState extends State<CyberAmbientBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(seconds: 10))
      ..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (context, child) {
        return CustomPaint(
          painter: _ParticleAuraPainter(_ctrl.value),
        );
      },
    );
  }
}

class _ParticleAuraPainter extends CustomPainter {
  final double progress;
  _ParticleAuraPainter(this.progress);

  static final List<math.Point<double>> _points = List.generate(
    28,
    (i) => math.Point(
      (math.sin(i * 99) * 0.5 + 0.5),
      (math.cos(i * 77) * 0.5 + 0.5),
    ),
  );

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Breathing central emerald aura orb
    final double breath = math.sin(progress * 2 * math.pi) * 0.12 + 1.0;
    final auraPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF0F7A5A).withValues(alpha: (0.22 * breath).clamp(0.0, 0.4)),
          const Color(0xFF0F7A5A).withValues(alpha: 0.06),
          Colors.transparent,
        ],
        stops: const [0.0, 0.52, 1.0],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width * 0.5, size.height * 0.45),
        radius: size.width * 0.45 * breath,
      ));

    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.45),
      size.width * 0.45 * breath,
      auraPaint,
    );

    // 2. Floating code / glowing neon green particles
    final particlePaint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < _points.length; i++) {
      final base = _points[i];
      final yOffset = (base.y - progress) % 1.0;
      final x = base.x * size.width + math.sin((progress + i) * math.pi * 2) * 22;
      final y = yOffset * size.height;
      final radius = (i % 3 + 1.4);
      final alpha = (math.sin(yOffset * math.pi) * 0.6).clamp(0.0, 0.6);

      particlePaint.color = const Color(0xFF1FD69E).withValues(alpha: alpha);
      canvas.drawCircle(Offset(x, y), radius, particlePaint);

      // Subtle glow halo around each particle
      final haloPaint = Paint()
        ..color = const Color(0xFF0F7A5A).withValues(alpha: alpha * 0.4)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0;
      canvas.drawCircle(Offset(x, y), radius + 2.0, haloPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParticleAuraPainter oldDelegate) => true;
}

/// Dynamic Scroll-Triggered Entrance Animation
/// Fires as soon as the element enters the viewport while scrolling!
class InViewReveal extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Offset offset;
  final Curve curve;
  final double scaleBegin;

  const InViewReveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 650),
    this.offset = const Offset(0, 35),
    this.curve = Curves.easeOutCubic,
    this.scaleBegin = 0.95,
  });

  @override
  State<InViewReveal> createState() => _InViewRevealState();
}

class _InViewRevealState extends State<InViewReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;
  late final Animation<double> _scale;
  bool _revealed = false;
  ScrollPosition? _scrollPosition;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.duration);
    _fade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: widget.curve),
    );
    _slide = Tween<Offset>(begin: widget.offset, end: Offset.zero).animate(
      CurvedAnimation(parent: _ctrl, curve: widget.curve),
    );
    _scale = Tween<double>(begin: widget.scaleBegin, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkVisibility();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollPosition?.removeListener(_onScroll);
    _scrollPosition = Scrollable.maybeOf(context)?.position;
    _scrollPosition?.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_revealed) {
      _checkVisibility();
    }
  }

  void _checkVisibility() {
    if (!mounted || _revealed) return;
    final renderObj = context.findRenderObject();
    if (renderObj is RenderBox && renderObj.hasSize) {
      final pos = renderObj.localToGlobal(Offset.zero);
      final screenHeight = MediaQuery.of(context).size.height;
      if (pos.dy < screenHeight - 20 && pos.dy + renderObj.size.height > -100) {
        _revealed = true;
        _scrollPosition?.removeListener(_onScroll);
        if (widget.delay == Duration.zero) {
          _ctrl.forward();
        } else {
          Future.delayed(widget.delay, () {
            if (mounted) _ctrl.forward();
          });
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollPosition?.removeListener(_onScroll);
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_revealed) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
    }
    return AnimatedBuilder(
      animation: _ctrl,
      child: widget.child,
      builder: (context, child) {
        return Opacity(
          opacity: _fade.value,
          child: Transform.translate(
            offset: _slide.value,
            child: Transform.scale(
              scale: _scale.value,
              child: child,
            ),
          ),
        );
      },
    );
  }
}

