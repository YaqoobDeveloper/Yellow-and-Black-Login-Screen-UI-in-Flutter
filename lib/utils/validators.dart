/// Form validators, shared across screens.
class Validators {
  Validators._();

  static final _emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  static String? email(String? v) {
    if (v == null || v.trim().isEmpty) return 'Please enter your email';
    if (!_emailPattern.hasMatch(v.trim())) return 'Please enter a valid email';
    return null;
  }

  /// Accepts a username, or an email when the value contains "@".
  static String? emailOrUsername(String? v) {
    if (v == null || v.trim().isEmpty) {
      return 'Please enter your email or username';
    }
    if (v.contains('@')) return email(v);
    if (v.trim().length < 3) return 'Username must be at least 3 characters';
    return null;
  }

  static String? password(String? v) {
    if (v == null || v.isEmpty) return 'Please enter your password';
    if (v.length < 6) return 'Password must be at least 6 characters';
    return null;
  }
}
