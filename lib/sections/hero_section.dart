import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/helpers.dart';
import '../utils/hero_image_bytes.dart';
import '../widgets/anim_effects.dart';

// Image ke paths. Agar tum file ka naam badlo to sirf yahan badlo.
const _heroImage = 'assets/images/my.png';
const _heroImageFallback = 'assets/images/front.png';

class HeroSection extends StatelessWidget {
  final VoidCallback onProjects;
  const HeroSection({super.key, required this.onProjects});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 950;
    final isTablet = width > 650 && width <= 950;

    // Responsive font sizes for the background typography (sleeker & proportional)
    final double flutterFontSize = isDesktop ? 76.0 : (isTablet ? 52.0 : 34.0);
    final double devFontSize = isDesktop ? 68.0 : (isTablet ? 46.0 : 30.0);

    final screenHeight = MediaQuery.of(context).size.height;
    // Fit hero within viewport so entire image and text are visible immediately
    final double heroHeight = (screenHeight - 150).clamp(460.0, 580.0);

    return Container(
      width: double.infinity,
      color: const Color(0xFF060709),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 40 : 20,
        vertical: 4,
      ),
      child: Column(
        children: [
          // Live status badge: AVAILABLE FOR CONTRACT & FULL-TIME (commented out)
          /*
          FadeSlideIn(
            delay: const Duration(milliseconds: 100),
            duration: const Duration(milliseconds: 600),
            offset: const Offset(0, -12),
            child: Container(
              margin: const EdgeInsets.only(bottom: 6),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: emerald.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: emeraldAccent.withValues(alpha: 0.35)),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PulsingStatusDot(),
                  SizedBox(width: 8),
                  Text(
                    'AVAILABLE FOR CONTRACT & FULL-TIME',
                    style: TextStyle(
                      fontFamily: 'SpaceGrotesk',
                      color: emeraldAccent,
                      fontSize: 10.5,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          */

          // Subtitle: HI THERE, I'M JAHANZAIB SUBHANI - with smooth slide-in
          FadeSlideIn(
            delay: const Duration(milliseconds: 250),
            duration: const Duration(milliseconds: 700),
            offset: const Offset(0, -15),
            child: Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 6),
              child: Text(
                "HI THERE, I'M ${myName.toUpperCase()}",
                style: TextStyle(
                  fontFamily: 'SpaceGrotesk',
                  color: Colors.white,
                  fontSize: isDesktop ? 22 : 16,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.5,
                ),
              ),
            ),
          ),

          // Main Hero Composition: Massive text + Ambient Rings + Person + Bio
          SizedBox(
            width: double.infinity,
            height: heroHeight,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                // 0. Living Cyber Ambient Background (breathing radiant aura & floating neon particles)
                const Positioned.fill(
                  child: CyberAmbientBackground(),
                ),


                // 2. Giant Typography Behind the Person (FLUTTER DEV / DEVELOPER </>)
                Positioned.fill(
                  child: FadeSlideIn(
                    delay: const Duration(milliseconds: 350),
                    duration: const Duration(milliseconds: 800),
                    offset: const Offset(0, 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Top Row: FLUTTER           DEV
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: isDesktop ? 40 : 10),
                              child: Text(
                                'FLUTTER',
                                style: TextStyle(
                                  fontFamily: 'Anton',
                                  fontSize: flutterFontSize,
                                  fontWeight: FontWeight.w900,
                                  height: 0.9,
                                  letterSpacing: 2,
                                  color: const Color(0xFF0F7A5A),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: isDesktop ? 40 : 10),
                              child: Text(
                                'DEV',
                                style: TextStyle(
                                  fontFamily: 'Anton',
                                  fontSize: flutterFontSize,
                                  fontWeight: FontWeight.w900,
                                  height: 0.9,
                                  letterSpacing: 2,
                                  color: const Color(0xFF0F7A5A),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isDesktop ? 16 : 8),

                        // Bottom Row: DEVELOPER           </>
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: isDesktop ? 40 : 10),
                              child: Text(
                                'DEVELOPER',
                                style: TextStyle(
                                  fontFamily: 'Anton',
                                  fontSize: devFontSize,
                                  fontWeight: FontWeight.w900,
                                  height: 0.9,
                                  letterSpacing: 1.5,
                                  color: const Color(0xFF0F7A5A),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: isDesktop ? 50 : 15),
                              child: Text(
                                '</>',
                                style: TextStyle(
                                  fontFamily: 'Anton',
                                  fontSize: devFontSize * 1.05,
                                  fontWeight: FontWeight.w900,
                                  height: 0.9,
                                  letterSpacing: 1.5,
                                  color: const Color(0xFF0F7A5A),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // 3. Center Developer Portrait Image (Spring entrance + subtle floating)
                Positioned(
                  top: -75,
                  bottom: 35,
                  child: SpringReveal(
                    delay: const Duration(milliseconds: 200),
                    duration: const Duration(milliseconds: 850),
                    child: FloatingBobbing(
                      distance: 8.0,
                      duration: const Duration(milliseconds: 3600),
                      child: SizedBox(
                        width: isDesktop ? 440 : (isTablet ? 340 : 250),
                        child: Image.asset(
                          _heroImage,
                          fit: BoxFit.contain,
                          alignment: Alignment.bottomCenter,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.memory(
                              frontImageBytes,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              errorBuilder: (context, error2, stackTrace2) {
                                return Image.asset(
                                  _heroImageFallback,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                // 4. Floating Tech Badges (Desktop / Tablet) with dynamic floating motion
                if (width > 720)
                  Positioned(
                    left: isDesktop ? 60 : 20,
                    top: isDesktop ? 70 : 35,
                    child: const FadeSlideIn(
                      delay: Duration(milliseconds: 600),
                      duration: Duration(milliseconds: 700),
                      offset: Offset(-20, 0),
                      child: FloatingBobbing(
                        distance: 10.0,
                        duration: Duration(milliseconds: 2800),
                        child: FloatingTechBadge(
                          icon: Icons.bolt_rounded,
                          label: '120 FPS Fluid UI',
                        ),
                      ),
                    ),
                  ),

                if (width > 850)
                  Positioned(
                    right: isDesktop ? 55 : 25,
                    top: isDesktop ? 35 : 15,
                    child: const FadeSlideIn(
                      delay: Duration(milliseconds: 750),
                      duration: Duration(milliseconds: 700),
                      offset: Offset(20, 0),
                      child: FloatingBobbing(
                        distance: -10.0,
                        duration: Duration(milliseconds: 3400),
                        child: FloatingTechBadge(
                          icon: Icons.devices_rounded,
                          label: 'Android • iOS • Web',
                        ),
                      ),
                    ),
                  ),

                // 5. Right Side Bio Text (Desktop) - Cleanly positioned below the green </> symbol
                if (isDesktop)
                  Positioned(
                    right: 35,
                    bottom: 12,
                    child: const FadeSlideIn(
                      delay: Duration(milliseconds: 850),
                      duration: Duration(milliseconds: 700),
                      offset: Offset(20, 0),
                      child: SizedBox(
                        width: 185,
                        child: Text(
                          'I AM A CREATIVE\nFLUTTER\nDEVELOPER WITH\nA STRONG FOCUS\nON MOBILE APPS\nAND SEAMLESS UI.',
                          style: TextStyle(
                            fontFamily: 'SpaceGrotesk',
                            color: Color(0xFFC7CBD6),
                            fontSize: 11.5,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.6,
                            height: 1.45,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Mobile / Tablet Bio Text
          if (!isDesktop) ...[
            const SizedBox(height: 15),
            const FadeSlideIn(
              delay: Duration.zero,
              duration: Duration(milliseconds: 300),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'I AM A CREATIVE FLUTTER DEVELOPER WITH A STRONG FOCUS ON MOBILE APPS AND SEAMLESS UI.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SpaceGrotesk',
                    color: Color(0xFFC7CBD6),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.6,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ],

          const SizedBox(height: 35),

          // Action Buttons: View Projects & Resume with Hover Lift
          FadeSlideIn(
            delay: const Duration(milliseconds: 950),
            duration: const Duration(milliseconds: 750),
            offset: const Offset(0, 25),
            child: Wrap(
              spacing: 16,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                HoverElevate(
                  translateY: -6,
                  scale: 1.05,
                  glowColor: emeraldAccent,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF0F7A5A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: onProjects,
                    icon: const Icon(Icons.arrow_downward, size: 18),
                    label: const Text(
                      'SEE MY WORKS',
                      style: TextStyle(
                        fontFamily: 'SpaceGrotesk',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
                HoverElevate(
                  translateY: -4,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFF2B303C)),
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () => openUrl(resumeUrl),
                    icon: const Icon(Icons.download, size: 18),
                    label: const Text(
                      'DOWNLOAD CV',
                      style: TextStyle(
                        fontFamily: 'SpaceGrotesk',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

/// Custom painter to draw ambient curved wave rings like in the reference design
class _HeroWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 1. Outer subtle ambient ring
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final rect1 = Rect.fromCenter(
      center: Offset(size.width * 0.5, size.height * 0.5),
      width: size.width * 0.92,
      height: size.height * 0.86,
    );
    canvas.drawOval(rect1, paint);

    // 2. Glowing vibrant emerald ambient ring
    final ringPaint = Paint()
      ..color = const Color(0xFF1FD69E).withValues(alpha: 0.28)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2;

    final rect2 = Rect.fromCenter(
      center: Offset(size.width * 0.5, size.height * 0.52),
      width: size.width * 0.72,
      height: size.height * 0.72,
    );
    canvas.drawOval(rect2, ringPaint);

    // 3. Subtle neon green inner aura ring
    final innerRingPaint = Paint()
      ..color = const Color(0xFF0F7A5A).withValues(alpha: 0.20)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5;

    final rect3 = Rect.fromCenter(
      center: Offset(size.width * 0.5, size.height * 0.53),
      width: size.width * 0.55,
      height: size.height * 0.58,
    );
    canvas.drawOval(rect3, innerRingPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}