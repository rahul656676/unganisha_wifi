import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/app_state.dart';
import '../models/plan.dart';
import '../theme/app_theme.dart';
import '../widgets/responsive_screen_container.dart';

class PlanListScreen extends StatelessWidget {
  const PlanListScreen({super.key});

  void _onSelectPlan(BuildContext context, Plan plan) {
    context.read<AppState>().selectPlan(plan);
    context.go('/status');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a plan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              context.read<AppState>().clearSession();
              context.go('/');
            },
          ),
        ],
      ),
      body: ResponsiveScreenContainer(
        maxWidth: 520,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            const Text(
              'Choose a plan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: UnganishaColors.textDark,
              ),
            ),
            const SizedBox(height: 20),
            ...kAvailablePlans.map(
              (plan) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _PlanCard(
                  plan: plan,
                  onSelect: () => _onSelectPlan(context, plan),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final Plan plan;
  final VoidCallback onSelect;

  const _PlanCard({required this.plan, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: UnganishaColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: Color(0xFFE4E7EE)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plan.name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: UnganishaColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    plan.formattedPrice,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: UnganishaColors.accent,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${plan.duration} — ${plan.speed}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: UnganishaColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: onSelect,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(90, 42),
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: const Text('Select'),
            ),
          ],
        ),
      ),
    );
  }
}
