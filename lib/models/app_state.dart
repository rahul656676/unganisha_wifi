import 'package:flutter/foundation.dart';
import 'plan.dart';

/// Holds all in-memory session state shared across the app:
/// phone number, OTP flow state, selected plan, and activation time.
///
/// This is intentionally simple (no persistence, no backend) since this
/// is a frontend-only v0 prototype.
class AppState extends ChangeNotifier {
  String? _phoneNumber;
  String? _areaCode;
  Plan? _selectedPlan;
  DateTime? _activatedAt;

  String? get phoneNumber => _phoneNumber;
  String? get areaCode => _areaCode;
  Plan? get selectedPlan => _selectedPlan;
  DateTime? get activatedAt => _activatedAt;

  /// Full display number, e.g. "+234 80 123 4567"
  String get fullPhoneDisplay {
    if (_phoneNumber == null) return '';
    return '${_areaCode ?? '+234'} $_phoneNumber';
  }

  void setPhoneNumber(String number, {String areaCode = '+234'}) {
    _phoneNumber = number;
    _areaCode = areaCode;
    notifyListeners();
  }

  void selectPlan(Plan plan) {
    _selectedPlan = plan;
    _activatedAt = DateTime.now();
    notifyListeners();
  }

  /// Clears all session data (used on logout).
  void clearSession() {
    _phoneNumber = null;
    _areaCode = null;
    _selectedPlan = null;
    _activatedAt = null;
    notifyListeners();
  }

  /// Clears only the plan (used when changing plan without logging out).
  void clearPlan() {
    _selectedPlan = null;
    _activatedAt = null;
    notifyListeners();
  }
}
