import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthProvider extends ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;

  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;

  // Getters
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get successMessage => _successMessage;

  // Clear messages to prevent toast/snackbar loops
  void clearMessages() {
    _errorMessage = null;
    _successMessage = null;
  }

  // --- Sign In ---
  Future<bool> signIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      _setError("Please fill in all fields.");
      return false;
    }

    _setLoading(true);
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.session != null) {
        _successMessage = "Welcome back!";
        notifyListeners();
        return true;
      }
      return false;
    } on AuthException catch (error) {
      _setError(error.message);
      return false;
    } catch (error) {
      _setError("An unexpected error occurred.");
      return false;
    } finally {
      _setLoading(false);
    }
  }
  Future<bool> signUp(String name, String email, String password) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _setError("Please fill in all fields.");
      return false;
    }

    _setLoading(true);
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {'display_name': name},
      );

      // If email confirmation is ON, session is null, but user is created
      if (response.user != null && response.session == null) {
        _successMessage = "Please check your inbox to confirm your email!";
        notifyListeners();
        return true; // Account creation was initiated successfully
      }

      // If email confirmation is OFF, session is returned immediately
      if (response.session != null) {
        _successMessage = "Account created successfully!";
        notifyListeners();
        return true;
      }

      return false;
      // Change this block in your auth_provider.dart:
    } on AuthException catch (error) {
      _setError(error.message);
      return false;
    } catch (error) {
      // 1. Print the actual error to your debug console so you can see it!
      print("SIGNUP ERROR DETECTED: $error");

      // 2. Show the real error message to the user instead of a generic one
      _setError(error.toString());
      return false;
    }
  }
  // --- Helper Methods ---
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }
}