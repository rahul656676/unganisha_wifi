/// Dummy authentication service for the v0 prototype.
///
/// There is NO real backend integration here. All methods simulate
/// network latency with a short delay and return canned results.
/// Replace the internals of these methods with real API calls later.
class DummyAuthService {
  static const String fixedOtp = '1234';

  /// Pretends to send an OTP to [fullPhoneNumber].
  /// Always "succeeds" for any non-empty, valid-looking number.
  Future<bool> sendOtp(String fullPhoneNumber) async {
    await Future.delayed(const Duration(milliseconds: 700));
    // In v0 this always succeeds - validation happens on the UI side.
    return true;
  }

  /// Verifies the OTP entered by the user.
  /// Only "1234" is accepted as correct for this prototype.
  Future<bool> verifyOtp(String enteredOtp) async {
    await Future.delayed(const Duration(milliseconds: 700));
    return enteredOtp.trim() == fixedOtp;
  }

  /// Pretends to resend the OTP. No real logic yet.
  Future<void> resendOtp(String fullPhoneNumber) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
