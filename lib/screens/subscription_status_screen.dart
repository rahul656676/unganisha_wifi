import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/responsive_screen_container.dart';

class SubscriptionStatusScreen extends StatelessWidget {
  const SubscriptionStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final plan = appState.selectedPlan;
    final activatedAt = appState.activatedAt;

    final activatedText = activatedAt != null
        ? DateFormat('dd MMM yyyy, HH:mm:ss').format(activatedAt)
        : '—';

    return Scaffold(
      body: ResponsiveScreenContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            const Icon(Icons.check_circle, size: 64, color: Colors.green),
            const SizedBox(height: 16),
            const Text(
              "You're online with Unganisha WiFi",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: UnganishaColors.textDark,
              ),
            ),
            const SizedBox(height: 28),
            Card(
              elevation: 0,
              color: UnganishaColors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: const BorderSide(color: Color(0xFFE4E7EE)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _StatusRow(label: 'Plan', value: plan?.name ?? 'No plan selected'),
                    const SizedBox(height: 12),
                    _StatusRow(label: 'Speed', value: plan?.speed ?? '—'),
                    const SizedBox(height: 12),
                    _StatusRow(label: 'Valid for', value: plan?.duration ?? '—'),
                    const SizedBox(height: 12),
                    _StatusRow(label: 'Activated at', value: activatedText),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  final String label;
  final String value;

  const _StatusRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: UnganishaColors.textMuted, fontSize: 14),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: UnganishaColors.textDark,
          ),
        ),
      ],
    );
  }
}
