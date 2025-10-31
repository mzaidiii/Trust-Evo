import 'dart:math';

class AuthService {
  static String? _generatedOTP;
  static String? _phoneNumber;

  // Simulate OTP sending (In production, use Firebase Auth or SMS API)
  static Future<void> sendOTP(String phoneNumber) async {
    // Generate random 6-digit OTP
    final random = Random();
    _generatedOTP = (100000 + random.nextInt(900000)).toString();
    _phoneNumber = phoneNumber;

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // In production, send OTP via SMS API
    print('📱 OTP sent to $phoneNumber: $_generatedOTP');

    // For testing, you can show the OTP in console
    // In production, remove this and integrate with SMS gateway
  }

  // Verify OTP
  static bool verifyOTP(String otp, String phoneNumber) {
    if (_phoneNumber != phoneNumber) return false;
    return _generatedOTP == otp;
  }

  // Clear OTP after verification
  static void clearOTP() {
    _generatedOTP = null;
    _phoneNumber = null;
  }
}
