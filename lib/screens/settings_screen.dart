import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/responsive_screen_container.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ResponsiveScreenContainer(
        maxWidth: 520,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            _buildSettingsTile(Icons.notifications_outlined, 'Notifications', 'Enabled'),
            _buildSettingsTile(Icons.language, 'Language', 'English'),
            _buildSettingsTile(Icons.help_outline, 'Help & Support', 'FAQs & Contact'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                context.read<AppState>().clearSession();
                context.go('/');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: UnganishaColors.error,
                side: const BorderSide(color: UnganishaColors.error, width: 2),
                elevation: 0,
              ),
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: UnganishaColors.surface,
        border: Border.all(color: const Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: UnganishaColors.background,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: UnganishaColors.primary),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right, color: UnganishaColors.textMuted),
      ),
    );
  }
}
