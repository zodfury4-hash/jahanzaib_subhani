import 'dart:math' as math;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Added Supabase package

import 'auth/auth.dart';

class FitnessSplash extends StatefulWidget {
  const FitnessSplash({super.key});

  @override
  State<FitnessSplash> createState() => _FitnessSplashState();
}

class _FitnessSplashState extends State<FitnessSplash>
    with TickerProviderStateMixin {
  late AnimationController _entranceController;
  late AnimationController _loopController;
  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;
  late Animation<double> _slideAnim;

  @override
  void initState() {
    super.initState();

    // One-time entrance animation
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    // Continuous loop for the logo (like Lottie)
    _loopController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat();

    _fadeAnim = CurvedAnimation(
      parent: _entranceController,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
    );

    _scaleAnim = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );

    _slideAnim = Tween<double>(begin: 25, end: 0).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(0.2, 0.7, curve: Curves.easeOutCubic),
      ),
    );

    _entranceController.forward();
    _navigate();
  }

  @override
  void dispose() {
    _entranceController.dispose();
    _loopController.dispose();
    super.dispose();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 3));

    // 1. Guard check: Ensure the widget is still in the widget tree
    if (!mounted) return;

    // 2. Network Check
    final connectivityResult = await Connectivity().checkConnectivity();
    final hasInternet = connectivityResult != ConnectivityResult.none;

    if (!hasInternet) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Network timeout. Please check your internet connection'),
          duration: Duration(seconds: 3),
        ),
      );
      return; // Stop execution if offline
    }

    // 3. Supabase Authentication Check
    final session = Supabase.instance.client.auth.currentSession;

    if (session != null) {
      // User has an active session. Navigate to Home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Placeholder(), // Replace this with your actual HomePage widget
        ),
      );
    } else {
      // No active session. Navigate to custom Auth screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FitnessAuthScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF050508), // Deep blue-black
      body: Stack(
        children: [
          // Soft ambient glow orbs
          _buildAmbientGlow(size),

          // Main content
          Center(
            child: AnimatedBuilder(
              animation: _entranceController,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeAnim,
                  child: Transform.scale(
                    scale: _scaleAnim.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Animated Infinity Logo
                        SizedBox(
                          width: size.width * 0.45,
                          height: size.height * 0.28,
                          child: AnimatedBuilder(
                            animation: _loopController,
                            builder: (context, child) {
                              return CustomPaint(
                                size: Size.infinite,
                                painter: _InfinityMotionPainter(
                                  progress: _loopController.value,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 48),

                        // Brand wordmark
                        Transform.translate(
                          offset: Offset(0, _slideAnim.value),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Aura",
                                    style: GoogleFonts.inter(
                                      fontSize: 42,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.white,
                                      letterSpacing: -2,
                                      height: 1,
                                    ),
                                  ),
                                  Text(
                                    "Fit",
                                    style: GoogleFonts.inter(
                                      fontSize: 42,
                                      fontWeight: FontWeight.w800,
                                      color: const Color(0xFF00F0FF), // Neon cyan
                                      letterSpacing: -2,
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Move. Sweat. Transform.",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white.withValues(alpha: 0.35),
                                  letterSpacing: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Bottom loading spinner
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: _buildLoadingIndicator(),
          ),
        ],
      ),
    );
  }

  Widget _buildAmbientGlow(Size size) {
    return Stack(
      children: [
        Positioned(
          top: size.height * 0.15,
          left: size.width * 0.2,
          child: Container(
            width: size.width * 0.6,
            height: size.width * 0.6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF00F0FF).withValues(alpha: 0.12),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: size.height * 0.1,
          right: size.width * 0.1,
          child: Container(
            width: size.width * 0.5,
            height: size.width * 0.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF7000FF).withValues(alpha: 0.08),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingIndicator() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              const Color(0xFF00F0FF).withValues(alpha: 0.5),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "LOADING",
          style: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.white.withValues(alpha: 0.2),
            letterSpacing: 4,
          ),
        ),
      ],
    );
  }
}

class _InfinityMotionPainter extends CustomPainter {
  final double progress;

  _InfinityMotionPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final scale = math.min(size.width, size.height) / 220;

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.scale(scale);

    // Build a lemniscate (infinity / ∞) path
    final path = Path();
    const double a = 75;
    const int steps = 200;

    for (int i = 0; i <= steps; i++) {
      final t = (i / steps) * 2 * math.pi;
      final denom = 1 + math.sin(t) * math.sin(t);
      final x = (a * math.cos(t)) / denom;
      final y = (a * math.sin(t) * math.cos(t)) / denom * 1.3; // slightly taller

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    final metrics = path.computeMetrics().toList();
    if (metrics.isEmpty) return;

    final metric = metrics.first;
    final totalLength = metric.length;

    // 1. Faint background trace (so the shape is always visible)
    final bgPaint = Paint()
      ..color = const Color(0xFF00F0FF).withValues(alpha: 0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(path, bgPaint);

    // 2. Animated light trail
    const double trailLength = 120.0;
    final double start = (progress * totalLength) % totalLength;
    final double end = (start + trailLength) % totalLength;

    late final Path trailPath;
    if (end > start) {
      trailPath = metric.extractPath(start, end);
    } else {
      trailPath = metric.extractPath(start, totalLength);
      trailPath.addPath(metric.extractPath(0, end), Offset.zero);
    }

    // Gradient shader for the trail
    final trailGradient = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFF00F0FF),
        Color(0xFF0080FF),
        Color(0xFF7000FF),
        Color(0xFF00F0FF),
      ],
    ).createShader(Rect.fromCenter(
      center: Offset.zero,
      width: 200,
      height: 150,
    ));

    // Outer glow
    canvas.drawPath(
      trailPath,
      Paint()
        ..shader = trailGradient
        ..style = PaintingStyle.stroke
        ..strokeWidth = 14
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10),
    );

    // Inner glow
    canvas.drawPath(
      trailPath,
      Paint()
        ..shader = trailGradient
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
    );

    // Core bright line
    canvas.drawPath(
      trailPath,
      Paint()
        ..shader = trailGradient
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5
        ..strokeCap = StrokeCap.round,
    );

    // 3. Leading orb (head of the trail)
    final tangent = metric.getTangentForOffset(end);
    if (tangent != null) {
      // Orb glow
      canvas.drawCircle(
        tangent.position,
        14,
        Paint()
          ..color = const Color(0xFF00F0FF).withValues(alpha: 0.3)
          ..style = PaintingStyle.fill
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10),
      );

      // Orb core
      canvas.drawCircle(
        tangent.position,
        5,
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill,
      );
    }

    // 4. Tail dot (fades out)
    final tailTangent = metric.getTangentForOffset(start);
    if (tailTangent != null) {
      canvas.drawCircle(
        tailTangent.position,
        3,
        Paint()
          ..color = const Color(0xFF00F0FF).withValues(alpha: 0.6)
          ..style = PaintingStyle.fill,
      );
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}