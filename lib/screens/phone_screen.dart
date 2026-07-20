import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/app_state.dart';
import '../services/dummy_auth_service.dart';
import '../theme/app_theme.dart';
import '../widgets/responsive_screen_container.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final DummyAuthService _authService = DummyAuthService();

  String _areaCode = '+234'; // Nigeria default
  String? _errorText;
  bool _isLoading = false;

  static const List<String> _areaCodes = ['+234', '+255', '+254', '+256'];

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _onGetOtpPressed() async {
    final phone = _phoneController.text.trim();

    setState(() {
      if (phone.isEmpty) {
        _errorText = 'Please enter your phone number.';
      } else if (phone.length < 9) {
        _errorText = 'Phone number must be at least 9 digits.';
      } else {
        _errorText = null;
      }
    });

    if (_errorText != null) return;

    setState(() => _isLoading = true);

    final fullNumber = '$_areaCode$phone';
    final success = await _authService.sendOtp(fullNumber);

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (success) {
      final appState = context.read<AppState>();
      appState.setPhoneNumber(phone, areaCode: _areaCode);
      context.push('/otp');
    } else {
      setState(() {
        _errorText = 'Could not send OTP. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveScreenContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            const Icon(Icons.wifi, size: 56, color: UnganishaColors.primary),
            const SizedBox(height: 12),
            const Text(
              'Unganisha WiFi',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: UnganishaColors.textDark,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Enter your phone number to continue',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: UnganishaColors.textMuted),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  child: DropdownButtonFormField<String>(
                    initialValue: _areaCode,
                    items: _areaCodes
                        .map((code) => DropdownMenuItem(
                              value: code,
                              child: Text(code),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => _areaCode = value);
                      }
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      hintText: 'XX XXX XXX',
                      errorText: _errorText,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            ElevatedButton(
              onPressed: _isLoading ? null : _onGetOtpPressed,
              child: _isLoading
                  ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.4,
                        color: Colors.white,
                      ),
                    )
                  : const Text('Get OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
