import 'package:flutter/gestures.dart';
import '../../utils/matrix_pos_bytes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_theme.dart';
import '../../widgets/anim_effects.dart';

class MatrixPosDetailPage extends StatefulWidget {
  const MatrixPosDetailPage({super.key});

  static const String title = 'Matrix POS';
  static const String tagline =
      'Point-of-Sale & retail management system with dual Admin and Cashier portals, local storage, bill printing, and auth.';
  static const String imageUrl = 'assets/images/matrix_pos_banner.png';
  static const List<String> tags = [
    'Flutter',
    'Provider',
    'Local Storage',
    'Thermal Printing',
    'Dual Portals',
    'Auth',
  ];

  @override
  State<MatrixPosDetailPage> createState() => _MatrixPosDetailPageState();
}

class _MatrixPosDetailPageState extends State<MatrixPosDetailPage> {
  final _scrollController = ScrollController();

  String get title => MatrixPosDetailPage.title;
  String get tagline => MatrixPosDetailPage.tagline;
  String get imageUrl => MatrixPosDetailPage.imageUrl;
  List<String> get tags => MatrixPosDetailPage.tags;

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

                    // 2. Desktop Screens Showcase (Top UI Showcase)
                    FadeSlideIn(
                      offset: const Offset(0, 30),
                      delay: const Duration(milliseconds: 150),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Desktop Terminal UI Showcase'),
                          const SizedBox(height: 8),
                          const Text(
                            'Production desktop screens featuring cashier register shift controls, fast barcode billing, payment checkout, offline inventory management, and customer Khata ledger.',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFC7CBD6),
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),
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
                            'Matrix POS is an ultra-fast, offline-first Point-of-Sale (POS) and retail management application tailored for stores, supermarkets, and billing counters. '
                            'Featuring dedicated Role-Based Authentication with two specialized portals: '
                            'The Admin Portal empowers store operators to register products/items, set prices, and onboard cashiers. '
                            'The Cashier Portal is optimized for high-speed checkout counters where cashiers scan goods, generate customer bills, and print physical thermal receipts via ESC/POS Bluetooth/USB printers. '
                            'Built entirely on high-performance Local Storage, Matrix POS operates reliably even during total internet blackouts.',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 4. Dual Portals (Admin vs Cashier)
                    InViewReveal(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Dual Dedicated Portals'),
                          const SizedBox(height: 14),
                          _buildDualPortalsGrid(isDesktop),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 5. Complete Step-by-Step Workflow
                    InViewReveal(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader('Retail Billing & Printing Pipeline'),
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
                          _buildFeatureItem('Dual Portal System: Clear separation between Admin store management and Cashier billing counters.'),
                          _buildFeatureItem('Admin Management: Register inventory items with barcodes, categories, stock counts, and onboard new cashiers.'),
                          _buildFeatureItem('High-Speed Cashier Billing: Instant cart calculations, tax/discount application, and sub-second checkout.'),
                          _buildFeatureItem('Thermal Bill Printing: Integrated ESC/POS Bluetooth and USB thermal receipt printing engine.'),
                          _buildFeatureItem('Offline-First Local Storage: All products, cashier credentials, and sales bills persist reliably on-device.'),
                          _buildFeatureItem('Role-Based Authentication: Protected credentials preventing unauthorized access to administrative store settings.'),
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
                            '• Offline-First High-Speed Local Storage: Retail counters cannot afford network latency. Built a local database pipeline (SQLite / Hive) allowing thousands of inventory items and transaction records to query in under 5 milliseconds.\n\n'
                            '• ESC/POS Thermal Receipt Formatting: Designed a custom ESC/POS byte-builder that supports 58mm and 80mm thermal receipt formats, cleanly aligning store logos, itemized quantities, tax summaries, and barcode footers.\n\n'
                            '• State Decoupling with Provider: Used Provider (CartProvider, AdminInventoryProvider) to keep cart updates and item calculations isolated from hardware printing tasks, ensuring the UI remains 100% fluid and responsive.',
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

  Widget _buildDualPortalsGrid(bool isDesktop) {
    final portals = [
      {
        'title': 'ADMIN PORTAL',
        'icon': Icons.admin_panel_settings_rounded,
        'badge': 'Inventory & Staff Registration',
        'desc':
            'Enables the store owner or manager to register inventory products (names, SKU barcodes, cost and selling prices), '
            'update stock levels, and register cashier staff with role-based login credentials.',
      },
      {
        'title': 'CASHIER PORTAL',
        'icon': Icons.point_of_sale_rounded,
        'badge': 'Billing & Thermal Receipt Printing',
        'desc':
            'High-speed cashier checkout terminal where staff add products to cart, apply discounts, '
            'calculate final totals, accept customer payments, and directly trigger Bluetooth/USB thermal bill prints.',
      },
    ];

    Widget buildPortalCard(Map<String, dynamic> p) {
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
                child: Icon(p['icon'] as IconData, color: emeraldAccent, size: 28),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          p['title'] as String,
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
                            p['badge'] as String,
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
                      p['desc'] as String,
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
    }

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: buildPortalCard(portals[0])),
          const SizedBox(width: 20),
          Expanded(child: buildPortalCard(portals[1])),
        ],
      );
    }

    return Column(
      children: portals.map((p) => buildPortalCard(p)).toList(),
    );
  }

  Widget _buildWorkflowSteps() {
    final steps = [
      {
        'step': '01',
        'title': 'Role-Based Authentication',
        'desc': 'User logs in as either Store Admin or Cashier, ensuring strict separation of privileges and sensitive inventory data.',
      },
      {
        'step': '02',
        'title': 'Admin Item & Cashier Registration',
        'desc': 'Admin creates new inventory product records with pricing and registers cashier staff credentials saved into Local Storage.',
      },
      {
        'step': '03',
        'title': 'Cashier Terminal Checkout',
        'desc': 'Cashier logs into the billing terminal, selects or scans customer items, and Provider computes subtotals and discounts in real time.',
      },
      {
        'step': '04',
        'title': 'Payment Confirmation & Inventory Deduction',
        'desc': 'Cashier selects payment method (Cash/Card). Total bill is recorded, and stock inventory automatically decrements locally.',
      },
      {
        'step': '05',
        'title': 'Thermal Receipt Printing',
        'desc': 'App compiles the formatted ESC/POS bill and prints it instantly to connected Bluetooth/USB 58mm or 80mm thermal receipt printers.',
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
      {'title': 'State Management (Provider)', 'desc': 'CartProvider and PosAdminProvider ensuring real-time cart calculations and inventory reactivity.'},
      {'title': 'Local Storage Engine', 'desc': 'High-speed offline-first local database (SQLite / Hive) storing items, cashiers, and sales bills.'},
      {'title': 'ESC/POS Thermal Printing', 'desc': 'Bluetooth and USB thermal printer driver formatting itemized receipts and store headers.'},
      {'title': 'Role-Based Authentication', 'desc': 'Secure role-checked login separating Admin configuration from Cashier sales operations.'},
      {'title': 'Sub-Second Checkout Flow', 'desc': 'Optimized for high-volume customer retail queues with zero network delay.'},
      {'title': 'Bill History & Sales Logs', 'desc': 'Historical receipt database allowing reprints, refunds, and daily cashier cash reconciliations.'},
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final double itemWidth = isDesktop
            ? (constraints.maxWidth - 32) / 3
            : double.infinity;
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: items.map((item) {
            return SizedBox(
              width: itemWidth,
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
      {
        'path': 'assets/images/matrix_pos/pos_01_login.png',
        'caption': 'ROLE-BASED LOGIN & AUTH',
        'desc': 'Admin & Cashier portal access with secure offline credentials',
        'aspect': 1024.0 / 476.0,
      },
      {
        'path': 'assets/images/matrix_pos/pos_02_inventory.png',
        'caption': 'INVENTORY & STOCK IN',
        'desc': 'Product catalog, SKU management, pricing & stock add',
        'aspect': 1024.0 / 475.0,
      },
      {
        'path': 'assets/images/matrix_pos/pos_03_open_shift.png',
        'caption': 'OPEN REGISTER SHIFT',
        'desc': 'Cash drawer opening float, starting notes & shift begin',
        'aspect': 1024.0 / 470.0,
      },
      {
        'path': 'assets/images/matrix_pos/pos_04_active_sale.png',
        'caption': 'HIGH-SPEED ACTIVE SALE',
        'desc': 'Billing counter, item categories, barcode search & cart',
        'aspect': 1024.0 / 475.0,
      },
      {
        'path': 'assets/images/matrix_pos/pos_05_khata_customers.png',
        'caption': 'CUSTOMERS & KHATA (UDHAAR)',
        'desc': 'Customer directory, credit ledger & debt tracking',
        'aspect': 832.0 / 822.0,
      },
      {
        'path': 'assets/images/matrix_pos/pos_06_payment_checkout.png',
        'caption': 'PAYMENT & CHECKOUT MODAL',
        'desc': 'Cash, card, split payments, customer link & change calc',
        'aspect': 1024.0 / 472.0,
      },
      {
        'path': 'assets/images/matrix_pos/pos_07_thermal_receipt_print.png',
        'caption': 'THERMAL BILL PRINT DIALOG',
        'desc': 'Final 80mm ESC/POS receipt generation & physical printing',
        'aspect': 1024.0 / 533.0,
      },
    ];

    return SizedBox(
      height: 380,
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
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          itemCount: screens.length,
          separatorBuilder: (_, __) => const SizedBox(width: 24),
          itemBuilder: (context, index) {
            final item = screens[index];
            return _InteractivePosDesktopCard(
              imagePath: item['path'] as String,
              caption: item['caption'] as String,
              desc: item['desc'] as String,
              aspectRatio: item['aspect'] as double,
            );
          },
        ),
      ),
    );
  }
}

class _InteractivePosDesktopCard extends StatefulWidget {
  final String imagePath;
  final String caption;
  final String desc;
  final double aspectRatio;

  const _InteractivePosDesktopCard({
    required this.imagePath,
    required this.caption,
    required this.desc,
    required this.aspectRatio,
  });

  @override
  State<_InteractivePosDesktopCard> createState() => _InteractivePosDesktopCardState();
}

class _InteractivePosDesktopCardState extends State<_InteractivePosDesktopCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bytes = MatrixPosBytes.getBytes(widget.imagePath);
    // Desktop monitor card width
    final cardWidth = widget.aspectRatio > 1.5 ? 540.0 : 360.0;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _isHovered ? -12 : 0, 0),
        width: cardWidth,
        decoration: BoxDecoration(
          color: const Color(0xFF0F1118),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _isHovered ? emeraldAccent : const Color(0xFF262C3D),
            width: _isHovered ? 2.0 : 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? emerald.withValues(alpha: 0.35)
                  : Colors.black.withValues(alpha: 0.5),
              blurRadius: _isHovered ? 26 : 14,
              offset: Offset(0, _isHovered ? 12 : 6),
              spreadRadius: _isHovered ? 2 : 0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Window Header (Desktop Monitor Frame Bar)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF161924),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha: 0.06))),
              ),
              child: Row(
                children: [
                  Container(width: 9, height: 9, decoration: const BoxDecoration(color: Color(0xFFFF5F56), shape: BoxShape.circle)),
                  const SizedBox(width: 6),
                  Container(width: 9, height: 9, decoration: const BoxDecoration(color: Color(0xFFFFBD2E), shape: BoxShape.circle)),
                  const SizedBox(width: 6),
                  Container(width: 9, height: 9, decoration: const BoxDecoration(color: Color(0xFF27C93F), shape: BoxShape.circle)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Matrix POS Desktop Terminal — ${widget.caption}',
                      style: const TextStyle(
                        color: Color(0xFF7A8398),
                        fontSize: 10.5,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            // Screen Display
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Center(
                      child: Image.asset(
                        widget.imagePath,
                        fit: BoxFit.contain,
                        gaplessPlayback: true,
                        errorBuilder: (_, __, ___) => const Center(
                          child: Icon(Icons.broken_image, color: Colors.white24),
                        ),
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

            const SizedBox(height: 10),

            // Caption & description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    style: TextStyle(
                      fontFamily: 'SpaceGrotesk',
                      color: _isHovered ? emeraldAccent : Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                    ),
                    child: Text(widget.caption),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.desc,
                    style: const TextStyle(
                      color: Color(0xFF8B92A5),
                      fontSize: 11.5,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
