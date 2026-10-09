import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart'; // Import Provider
import '../../core/provider/auth.dart';
// import 'auth_provider.dart'; // Import your AuthProvider

class FitnessAuthScreen extends StatefulWidget {
  const FitnessAuthScreen({super.key});

  @override
  State<FitnessAuthScreen> createState() => _FitnessAuthScreenState();
}

class _FitnessAuthScreenState extends State<FitnessAuthScreen> {
  final PageController _pageController = PageController();
  bool _isLoginSelected = true;

  // Form Controllers
  final _loginEmailController = TextEditingController();
  final _loginPasswordController = TextEditingController();
  final _signupNameController = TextEditingController();
  final _signupEmailController = TextEditingController();
  final _signupPasswordController = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _signupNameController.dispose();
    _signupEmailController.dispose();
    _signupPasswordController.dispose();
    super.dispose();
  }

  void _showSnackBar(String message, {bool isError = true}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
        ),
        backgroundColor: isError ? const Color(0xFFE53935) : const Color(0xFF00F0FF).withOpacity(0.8),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  // --- Trigger Sign In ---
  Future<void> _handleSignIn(AuthProvider authProvider) async {
    final success = await authProvider.signIn(
      _loginEmailController.text.trim(),
      _loginPasswordController.text.trim(),
    );

    if (success && mounted) {
      // TODO: Replace with your actual dashboard/home route
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
    }
  }

  // --- Trigger Sign Up ---
  Future<void> _handleSignUp(AuthProvider authProvider) async {
    final success = await authProvider.signUp(
      _signupNameController.text.trim(),
      _signupEmailController.text.trim(),
      _signupPasswordController.text.trim(),
    );

    if (success && mounted) {
      final hasSession = authProvider.successMessage?.contains("successful") ?? false;
      if (!hasSession) {
        // If they need to confirm their email, toggle back to login screen
        _toggleTab(true);
      } else {
        // TODO: Replace with your actual dashboard/home route
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
      }
    }
  }

  void _toggleTab(bool loginSelected) {
    setState(() {
      _isLoginSelected = loginSelected;
    });
    _pageController.animateToPage(
      loginSelected ? 0 : 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Watch state variables from Provider
    final authProvider = context.watch<AuthProvider>();

    // Listen to error/success updates asynchronously outside the build cycle
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (authProvider.errorMessage != null) {
        _showSnackBar(authProvider.errorMessage!);
        authProvider.clearMessages();
      }
      if (authProvider.successMessage != null) {
        _showSnackBar(authProvider.successMessage!, isError: false);
        authProvider.clearMessages();
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFF050508),
      body: Stack(
        children: [
          _buildAmbientGlow(size),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 40),
                    _buildHeader(),
                    const SizedBox(height: 40),
                    _buildToggleBar(authProvider.isLoading),
                    const SizedBox(height: 32),
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        physics: authProvider.isLoading
                            ? const NeverScrollableScrollPhysics()
                            : const ClampingScrollPhysics(),
                        onPageChanged: (index) {
                          setState(() {
                            _isLoginSelected = index == 0;
                          });
                        },
                        children: [
                          _buildLoginView(authProvider),
                          _buildSignupView(authProvider),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Aura",
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w200,
                color: Colors.white,
                letterSpacing: -1.5,
              ),
            ),
            Text(
              "Fit",
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF00F0FF),
                letterSpacing: -1.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "YOUR ULTIMATE FITNESS DESTINATION",
          style: GoogleFonts.poppins(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.3),
            letterSpacing: 3,
          ),
        ),
      ],
    );
  }

  Widget _buildToggleBar(bool isLoading) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: Colors.white.withOpacity(0.05),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutCubic,
            alignment: _isLoginSelected ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: (MediaQuery.of(context).size.width - 48) / 2,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF00F0FF).withOpacity(0.15),
                    const Color(0xFF7000FF).withOpacity(0.15),
                  ],
                ),
                border: Border.all(
                  color: const Color(0xFF00F0FF).withOpacity(0.4),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00F0FF).withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 1,
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: isLoading ? null : () => _toggleTab(true),
                  behavior: HitTestBehavior.opaque,
                  child: Center(
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: _isLoginSelected ? FontWeight.w600 : FontWeight.w400,
                        color: _isLoginSelected ? Colors.white : Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: isLoading ? null : () => _toggleTab(false),
                  behavior: HitTestBehavior.opaque,
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: !_isLoginSelected ? FontWeight.w600 : FontWeight.w400,
                        color: !_isLoginSelected ? Colors.white : Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoginView(AuthProvider authProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildInputField(
          controller: _loginEmailController,
          hintText: "Email Address",
          icon: Icons.mail_outline_rounded,
          keyboardType: TextInputType.emailAddress,
          enabled: !authProvider.isLoading,
        ),
        const SizedBox(height: 16),
        _buildInputField(
          controller: _loginPasswordController,
          hintText: "Password",
          icon: Icons.lock_outline_rounded,
          obscureText: true,
          enabled: !authProvider.isLoading,
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: authProvider.isLoading ? null : () {},
            child: Text(
              "Forgot Password?",
              style: GoogleFonts.poppins(
                color: const Color(0xFF00F0FF).withOpacity(0.7),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        _buildActionButton(
          label: "SIGN IN TO AURA",
          isLoading: authProvider.isLoading,
          onPressed: () => _handleSignIn(authProvider),
        ),
      ],
    );
  }

  Widget _buildSignupView(AuthProvider authProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildInputField(
          controller: _signupNameController,
          hintText: "Full Name",
          icon: Icons.person_outline_rounded,
          enabled: !authProvider.isLoading,
        ),
        const SizedBox(height: 16),
        _buildInputField(
          controller: _signupEmailController,
          hintText: "Email Address",
          icon: Icons.mail_outline_rounded,
          keyboardType: TextInputType.emailAddress,
          enabled: !authProvider.isLoading,
        ),
        const SizedBox(height: 16),
        _buildInputField(
          controller: _signupPasswordController,
          hintText: "Create Password",
          icon: Icons.lock_outline_rounded,
          obscureText: true,
          enabled: !authProvider.isLoading,
        ),
        const SizedBox(height: 32),
        _buildActionButton(
          label: "CREATE ACCOUNT",
          isLoading: authProvider.isLoading,
          onPressed: () => _handleSignUp(authProvider),
        ),
      ],
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    bool enabled = true,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      enabled: enabled,
      style: GoogleFonts.poppins(color: enabled ? Colors.white : Colors.white38, fontSize: 14),
      cursorColor: const Color(0xFF00F0FF),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(color: Colors.white.withOpacity(0.3), fontSize: 14),
        prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.4), size: 20),
        filled: true,
        fillColor: Colors.white.withOpacity(0.02),
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.02), width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.06), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF00F0FF), width: 1.5),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required bool isLoading,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          colors: isLoading
              ? [const Color(0xFF555555), const Color(0xFF333333)]
              : [const Color(0xFF00F0FF), const Color(0xFF7000FF)],
        ),
        boxShadow: isLoading
            ? []
            : [
          BoxShadow(
            color: const Color(0xFF00F0FF).withOpacity(0.25),
            blurRadius: 15,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: isLoading
            ? const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00F0FF)),
          ),
        )
            : Text(
          label,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildAmbientGlow(Size size) {
    return Stack(
      children: [
        Positioned(
          top: -size.height * 0.1,
          right: -size.width * 0.1,
          child: Container(
            width: size.width * 0.7,
            height: size.width * 0.7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF7000FF).withOpacity(0.12),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -size.height * 0.1,
          left: -size.width * 0.1,
          child: Container(
            width: size.width * 0.8,
            height: size.width * 0.8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF00F0FF).withOpacity(0.08),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}